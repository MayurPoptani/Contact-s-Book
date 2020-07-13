import 'dart:io';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;

part 'Database.g.dart';

class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1,)();
  TextColumn get number => text().withLength(min: 10)();
  DateTimeColumn get createdOn => dateTime().clientDefault(() => DateTime.now())();
  BoolColumn get gender => boolean().clientDefault(() => true)();
}

class Groups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1,)();
  TextColumn get description => text().withLength(min: 1,)();
  DateTimeColumn get createdOn => dateTime().clientDefault(() => DateTime.now())();
}

class ContactsAndGroups extends Table {
  IntColumn get groupId => integer()();
  IntColumn get contactId => integer()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(Path.join(dbFolder.path, 'db.sqlite'));
    // if(file.existsSync()) file.deleteSync();
    return VmDatabase(file);
  });
}


@UseMoor(tables: [Contacts, Groups, ContactsAndGroups])
class Database extends _$Database {
  
  @override int get schemaVersion => 1;
  
  Database() : super(_openConnection());
  
  
  
  
  Future<List<Contact>> getContactsList() => select(contacts).get();
  Stream<List<Contact>> getContactsStream() => select(contacts).watch();
  Stream<List<Group>> getGroupsStream() => select(groups).watch();
  Stream<List<ContactsAndGroup>> getGroupMembersStream(Group group) => (select(contactsAndGroups)..where((tbl) => tbl.groupId.equals(group.id))).watch();
  
  
  Future<int> addNewOrUpdateContact(Contact contact) async {
    int index = -1; 
    try {
      if(contact.id==null) index = await into(contacts).insert(contact);
      else index = await into(contacts).insertOnConflictUpdate(contact,);
    } catch (e) {
      print("Exception When inserting Contact Entry. E = "+e.toString());
    }
    return index;
  }
  
  Future<int> deleteContact(Contact contact) async {
    int index = -1; 
    try {
      if(contact.id==null) index = 0;
      else 
      index = await delete(contacts).delete(contact);
      await batch((batch) {
        batch.deleteWhere(contactsAndGroups, ($ContactsAndGroupsTable tbl) => tbl.contactId.equals(contact.id));
      });
    } catch (e) {
      print("Exception When inserting Contact Entry");
    }
    return index;
  }
  
  Future<int> deleteGroup(Group group) async {
    int index = -1; 
    try {
      if(group.id==null) index = 0;
      else 
      await batch((batch) {
        batch.delete(groups, group);
        batch.deleteWhere(contactsAndGroups, ($ContactsAndGroupsTable tbl) => (tbl).groupId.equals(group.id));
      });
    } catch (e) {
      print("Exception When inserting Contact Entry");
    }
    return index;
  }
  
  Future<int> addNewOrUpdateGroup(Group group, List<int> contactIds) async {
    int grpIndex = -1; 
    try {
      if(group.id==null) {
        grpIndex = await into(groups).insert(group);
        await batch((batch) {
          batch.insertAll(contactsAndGroups, contactIds.map((e) => ContactsAndGroup(groupId: grpIndex, contactId: e)).toList());
        });
      }
      else {
        grpIndex = await into(groups).insertOnConflictUpdate(group);
        batch((batch) {
          batch.deleteWhere(contactsAndGroups, ($ContactsAndGroupsTable tbl) => tbl.groupId.equals(group.id));
          batch.insertAll(contactsAndGroups, contactIds.map((e) => ContactsAndGroup(groupId: group.id, contactId: e)).toList());
        });
      }
      // contactIds.map((e) => ContactsAndGroup(id: null, groupId: grpIndex, contactId: e)).toList()
    } catch (e) {
      print("Exception When inserting Contact Entry");
    }
    return grpIndex;
  }
  
}