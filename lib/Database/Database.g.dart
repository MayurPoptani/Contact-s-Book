// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Contact extends DataClass implements Insertable<Contact> {
  final int id;
  final String name;
  final String number;
  final DateTime createdOn;
  final bool gender;
  Contact(
      {@required this.id,
      @required this.name,
      @required this.number,
      @required this.createdOn,
      @required this.gender});
  factory Contact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Contact(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      number:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_on']),
      gender:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    if (!nullToAbsent || createdOn != null) {
      map['created_on'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<bool>(gender);
    }
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      number: serializer.fromJson<String>(json['number']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      gender: serializer.fromJson<bool>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'number': serializer.toJson<String>(number),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'gender': serializer.toJson<bool>(gender),
    };
  }

  Contact copyWith(
          {int id,
          String name,
          String number,
          DateTime createdOn,
          bool gender}) =>
      Contact(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        createdOn: createdOn ?? this.createdOn,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('createdOn: $createdOn, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(number.hashCode, $mrjc(createdOn.hashCode, gender.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Contact &&
          other.id == this.id &&
          other.name == this.name &&
          other.number == this.number &&
          other.createdOn == this.createdOn &&
          other.gender == this.gender);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> number;
  final Value<DateTime> createdOn;
  final Value<bool> gender;
  const ContactsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.gender = const Value.absent(),
  });
  ContactsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String number,
    this.createdOn = const Value.absent(),
    this.gender = const Value.absent(),
  })  : name = Value(name),
        number = Value(number);
  static Insertable<Contact> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> number,
    Expression<DateTime> createdOn,
    Expression<bool> gender,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (number != null) 'number': number,
      if (createdOn != null) 'created_on': createdOn,
      if (gender != null) 'gender': gender,
    });
  }

  ContactsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> number,
      Value<DateTime> createdOn,
      Value<bool> gender}) {
    return ContactsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      createdOn: createdOn ?? this.createdOn,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (createdOn.present) {
      map['created_on'] = Variable<DateTime>(createdOn.value);
    }
    if (gender.present) {
      map['gender'] = Variable<bool>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('createdOn: $createdOn, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

class $ContactsTable extends Contacts with TableInfo<$ContactsTable, Contact> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContactsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedTextColumn _number;
  @override
  GeneratedTextColumn get number => _number ??= _constructNumber();
  GeneratedTextColumn _constructNumber() {
    return GeneratedTextColumn('number', $tableName, false, minTextLength: 10);
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'created_on',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now();
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedBoolColumn _gender;
  @override
  GeneratedBoolColumn get gender => _gender ??= _constructGender();
  GeneratedBoolColumn _constructGender() {
    return GeneratedBoolColumn(
      'gender',
      $tableName,
      false,
    )..clientDefault = () => true;
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, number, createdOn, gender];
  @override
  $ContactsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contacts';
  @override
  final String actualTableName = 'contacts';
  @override
  VerificationContext validateIntegrity(Insertable<Contact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('created_on')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['created_on'], _createdOnMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender'], _genderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Contact map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Contact.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContactsTable createAlias(String alias) {
    return $ContactsTable(_db, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final int id;
  final String name;
  final String description;
  final DateTime createdOn;
  Group(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.createdOn});
  factory Group.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Group(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_on']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || createdOn != null) {
      map['created_on'] = Variable<DateTime>(createdOn);
    }
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
    );
  }

  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdOn': serializer.toJson<DateTime>(createdOn),
    };
  }

  Group copyWith(
          {int id, String name, String description, DateTime createdOn}) =>
      Group(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        createdOn: createdOn ?? this.createdOn,
      );
  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdOn: $createdOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(description.hashCode, createdOn.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Group &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdOn == this.createdOn);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createdOn;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdOn = const Value.absent(),
  });
  GroupsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String description,
    this.createdOn = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<Group> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<DateTime> createdOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdOn != null) 'created_on': createdOn,
    });
  }

  GroupsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<DateTime> createdOn}) {
    return GroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdOn: createdOn ?? this.createdOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdOn.present) {
      map['created_on'] = Variable<DateTime>(createdOn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdOn: $createdOn')
          ..write(')'))
        .toString();
  }
}

class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  final GeneratedDatabase _db;
  final String _alias;
  $GroupsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'created_on',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now();
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, description, createdOn];
  @override
  $GroupsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'groups';
  @override
  final String actualTableName = 'groups';
  @override
  VerificationContext validateIntegrity(Insertable<Group> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_on')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['created_on'], _createdOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Group map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Group.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(_db, alias);
  }
}

class ContactsAndGroup extends DataClass
    implements Insertable<ContactsAndGroup> {
  final int groupId;
  final int contactId;
  ContactsAndGroup({@required this.groupId, @required this.contactId});
  factory ContactsAndGroup.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ContactsAndGroup(
      groupId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}group_id']),
      contactId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}contact_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<int>(groupId);
    }
    if (!nullToAbsent || contactId != null) {
      map['contact_id'] = Variable<int>(contactId);
    }
    return map;
  }

  ContactsAndGroupsCompanion toCompanion(bool nullToAbsent) {
    return ContactsAndGroupsCompanion(
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      contactId: contactId == null && nullToAbsent
          ? const Value.absent()
          : Value(contactId),
    );
  }

  factory ContactsAndGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ContactsAndGroup(
      groupId: serializer.fromJson<int>(json['groupId']),
      contactId: serializer.fromJson<int>(json['contactId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupId': serializer.toJson<int>(groupId),
      'contactId': serializer.toJson<int>(contactId),
    };
  }

  ContactsAndGroup copyWith({int groupId, int contactId}) => ContactsAndGroup(
        groupId: groupId ?? this.groupId,
        contactId: contactId ?? this.contactId,
      );
  @override
  String toString() {
    return (StringBuffer('ContactsAndGroup(')
          ..write('groupId: $groupId, ')
          ..write('contactId: $contactId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(groupId.hashCode, contactId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ContactsAndGroup &&
          other.groupId == this.groupId &&
          other.contactId == this.contactId);
}

class ContactsAndGroupsCompanion extends UpdateCompanion<ContactsAndGroup> {
  final Value<int> groupId;
  final Value<int> contactId;
  const ContactsAndGroupsCompanion({
    this.groupId = const Value.absent(),
    this.contactId = const Value.absent(),
  });
  ContactsAndGroupsCompanion.insert({
    @required int groupId,
    @required int contactId,
  })  : groupId = Value(groupId),
        contactId = Value(contactId);
  static Insertable<ContactsAndGroup> custom({
    Expression<int> groupId,
    Expression<int> contactId,
  }) {
    return RawValuesInsertable({
      if (groupId != null) 'group_id': groupId,
      if (contactId != null) 'contact_id': contactId,
    });
  }

  ContactsAndGroupsCompanion copyWith(
      {Value<int> groupId, Value<int> contactId}) {
    return ContactsAndGroupsCompanion(
      groupId: groupId ?? this.groupId,
      contactId: contactId ?? this.contactId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (contactId.present) {
      map['contact_id'] = Variable<int>(contactId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsAndGroupsCompanion(')
          ..write('groupId: $groupId, ')
          ..write('contactId: $contactId')
          ..write(')'))
        .toString();
  }
}

class $ContactsAndGroupsTable extends ContactsAndGroups
    with TableInfo<$ContactsAndGroupsTable, ContactsAndGroup> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContactsAndGroupsTable(this._db, [this._alias]);
  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  GeneratedIntColumn _groupId;
  @override
  GeneratedIntColumn get groupId => _groupId ??= _constructGroupId();
  GeneratedIntColumn _constructGroupId() {
    return GeneratedIntColumn(
      'group_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contactIdMeta = const VerificationMeta('contactId');
  GeneratedIntColumn _contactId;
  @override
  GeneratedIntColumn get contactId => _contactId ??= _constructContactId();
  GeneratedIntColumn _constructContactId() {
    return GeneratedIntColumn(
      'contact_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [groupId, contactId];
  @override
  $ContactsAndGroupsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contacts_and_groups';
  @override
  final String actualTableName = 'contacts_and_groups';
  @override
  VerificationContext validateIntegrity(Insertable<ContactsAndGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id'], _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('contact_id')) {
      context.handle(_contactIdMeta,
          contactId.isAcceptableOrUnknown(data['contact_id'], _contactIdMeta));
    } else if (isInserting) {
      context.missing(_contactIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ContactsAndGroup map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ContactsAndGroup.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContactsAndGroupsTable createAlias(String alias) {
    return $ContactsAndGroupsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ContactsTable _contacts;
  $ContactsTable get contacts => _contacts ??= $ContactsTable(this);
  $GroupsTable _groups;
  $GroupsTable get groups => _groups ??= $GroupsTable(this);
  $ContactsAndGroupsTable _contactsAndGroups;
  $ContactsAndGroupsTable get contactsAndGroups =>
      _contactsAndGroups ??= $ContactsAndGroupsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [contacts, groups, contactsAndGroups];
}
