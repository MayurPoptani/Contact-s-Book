import 'package:contacts_app/Database/Database.dart';
import 'package:contacts_app/HomePage-Pages/ContactsPage.dart';
import 'package:contacts_app/variables.dart';
import 'package:contacts_app/widgets/TextKeyAndValueWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

Future<Contact> addNewContactItemDialog(BuildContext context, {Contact contact}) async {
  var nameController = TextEditingController(text: contact==null?null:contact.name);
  var numberController = TextEditingController(text: contact==null?null:contact.number);
  // Color selectedTextColor = isDark?Colors.black:Colors.white;
  Color selectedTextColor = Colors.white;
  Color unSelectedTextColor = !isDark?Colors.black:Colors.white;
  Color maleColor = isDark?Colors.red[300]:Colors.red[500];
  Color femaleColor = isDark?Colors.indigo[300]:Colors.indigo[500];
  bool isMale = contact==null?true:contact.gender;
  return await showDialog<Contact>(
    context: context,
    useRootNavigator: true,
    // useSafeArea: true,
    // barrierColor: !isDark?null:Colors.white.withOpacity(0.05),
    builder: (_) {
      return StatefulBuilder(builder: (_, stateSetter) => AlertDialog(
          backgroundColor: isDark?Colors.black:Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(contact==null?"New Contact":"Update Contact", style: TextStyle(letterSpacing: 0.25,),),
          content: Container(
              color: isDark?Colors.black:Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HKeyValueWidget(
                    "Name (Label)",
                    TextFormField(
                      controller: nameController,
                      cursorColor: isDark?Colors.white:Colors.black,
                      style: TextStyle(letterSpacing: 0.25, fontSize: 14.0),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        filled: true,
                        hintText: "Eg: Mayur Poptani",
                        fillColor: isDark?Colors.white24:Colors.black.withOpacity(0.05),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.black, width: 0, style: BorderStyle.none)),
                      ),
                    ),
                    boldKey: true,
                  ),
                  HeightBox(8),
                  HKeyValueWidget(
                    "Number",
                    TextFormField(
                      controller: numberController,
                      cursorColor: isDark?Colors.white:Colors.black,
                      style: TextStyle(letterSpacing: 0.25, fontSize: 14.0),
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      maxLength: 10,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        filled: true,
                        hintText: "Eg: 9527386497",
                        fillColor: isDark?Colors.white24:Colors.black.withOpacity(0.05),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.black, width: 0, style: BorderStyle.none)),
                      ),
                    ),
                    boldKey: true,
                  ),
                  HeightBox(8),
                  HKeyValueWidget(
                    "Gender",
                    Container(
                      height: 50, width: double.maxFinite,
                      child: Row(
                        children: [
                          Expanded(child: "Male".text.color(isMale?selectedTextColor:unSelectedTextColor).makeCentered().p12().box.color(isMale?maleColor:Colors.transparent).width(double.maxFinite).rounded.makeCentered()
                          .click(() => stateSetter(() => isMale = true)).makeCentered()),
                          Expanded(child: "Female".text.color(!isMale?selectedTextColor:unSelectedTextColor).makeCentered().p12().box.color(!isMale?femaleColor:Colors.transparent).width(double.maxFinite).rounded.makeCentered()
                          .click(() => stateSetter(() => isMale = false)).makeCentered()),
                        ],
                      ),
                    ),
                    boldKey: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(contact!=null) FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        // color: isDark?Colors.white24:Colors.black12,
                        color: isDark?Colors.red[300]:Colors.red[600],
                        // child: Text(contact==null?"Add":"Update", style: TextStyle(color: isDark?Colors.white:Colors.black87),),
                        child: Text("Delete", style: TextStyle(color: Colors.white),),
                        onPressed: () async {
                          print("Deleted Row Count = "+(await db.deleteContact(contact)).toString());
                          Navigator.of(context, rootNavigator: true).pop();
                        }
                      ), 
                      if(contact!=null) WidthBox(8),
                      FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        // color: isDark?Colors.white24:Colors.black12,
                        color: isDark?Colors.blue[300]:Colors.blue[600],
                        // child: Text(contact==null?"Add":"Update", style: TextStyle(color: isDark?Colors.white:Colors.black87),),
                        child: Text(contact==null?"Add":"Update", style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          if(nameController.text.trim().isNotEmpty && numberController.text.trim().length==10) {
                            Contact c;
                            if(contact==null) c = Contact(name: nameController.text.trim(), gender: isMale, createdOn: null, id: null, number: numberController.text.trim());
                            else c = contact.copyWith(name: nameController.text.trim(), gender: isMale, number: numberController.text.trim());
                            Navigator.of(context, rootNavigator: true).pop<Contact>(c);
                          }
                        }
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      );
    }
  );
}


Future<MapEntry<Group,List<int>>> addNewGroupItemDialog(BuildContext context, {MapEntry<Group,List<int>> group}) async {
  var nameController = TextEditingController(text: group==null?null:group.key.name);
  var descController = TextEditingController(text: group==null?null:group.key.description);
  List<int> contactIds = group==null?[]:group.value;
  return await showDialog<MapEntry<Group,List<int>>>(
    context: context,
    useRootNavigator: true,
    // useSafeArea: true,
    // barrierColor: !isDark?null:Colors.white.withOpacity(0.05),
    builder: (_) {
      return StatefulBuilder(builder: (_, stateSetter) => AlertDialog(
          backgroundColor: isDark?Colors.black:Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(group==null?"Add Group":"Update Group", style: TextStyle(letterSpacing: 0.25,),),
          content: Container(
              color: isDark?Colors.black:Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HKeyValueWidget(
                    "Group Name",
                    TextFormField(
                      controller: nameController,
                      cursorColor: isDark?Colors.white:Colors.black,
                      style: TextStyle(letterSpacing: 0.25, fontSize: 14.0),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        filled: true,
                        hintText: "Eg: Office Group",
                        fillColor: isDark?Colors.white24:Colors.black.withOpacity(0.05),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.black, width: 0, style: BorderStyle.none)),
                      ),
                    ),
                    boldKey: true,
                  ),
                  HeightBox(8),
                  HKeyValueWidget(
                    "Description",
                    TextFormField(
                      controller: descController,
                      cursorColor: isDark?Colors.white:Colors.black,
                      style: TextStyle(letterSpacing: 0.25, fontSize: 14.0),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        filled: true,
                        hintText: "(Optional) Eg: for office work and schedule discussion",
                        fillColor: isDark?Colors.white24:Colors.black.withOpacity(0.05),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.black, width: 0, style: BorderStyle.none)),
                      ),
                    ),
                    boldKey: true,
                  ),
                  HeightBox(8),
                  Container(
                    child: Row(children: [
                      "Participants".text.size(14).semiBold.make(),
                      Expanded(
                        child: ((contactIds==null||contactIds.length==0)?"Tap to select":"${contactIds.length} Contacts\nTap to reselect").text.size(14).make().px8()
                        .click(() async {
                          var newList = await Navigator.of(context).push<List<int>>(MaterialPageRoute(builder: (_) => ContactsPage(contactIds: contactIds, selectionModeOn: true,)));
                          if(newList!=null) stateSetter(() => contactIds = newList);
                        }).make(),
                      ),
                    ], crossAxisAlignment: CrossAxisAlignment.start,),
                  ).pOnly(left: 8).h(50).w(double.maxFinite),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(group!=null) FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        // color: isDark?Colors.white24:Colors.black12,
                        color: isDark?Colors.red[300]:Colors.red[600],
                        // child: Text(contact==null?"Add":"Update", style: TextStyle(color: isDark?Colors.white:Colors.black87),),
                        child: Text("Delete", style: TextStyle(color: Colors.white),),
                        onPressed: () async {
                          print("Deleted Row Count = "+(await db.deleteGroup(group.key)).toString());
                          Navigator.of(context).pop();
                        }
                      ), 
                      if(group!=null) WidthBox(8),
                      FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        color: isDark?Colors.white24:Colors.black12,
                        child: Text(group==null?"Add":"Update", style: TextStyle(color: isDark?Colors.white:Colors.black87),),
                        onPressed: () {
                          if(nameController.text.trim().isNotEmpty && contactIds!=null && contactIds.length>1) {
                            Group g;
                            if(group==null) g = Group(name: nameController.text.trim(), description: descController.text.trim(), createdOn: null, id: null);
                            else g = group.key.copyWith(name: nameController.text.trim(), description: descController.text.trim(),);
                            Navigator.of(context, rootNavigator: true).pop<MapEntry<Group,List<int>>>(MapEntry(g,contactIds));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
        ),
      );
    }
  );
}