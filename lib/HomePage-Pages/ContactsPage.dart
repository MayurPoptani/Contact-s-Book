import 'package:contacts_app/HomePage-Pages/functions/dialogs.dart';
import 'package:contacts_app/HomePage-Pages/widgets/ContactListItem.dart';
import 'package:contacts_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:contacts_app/Database/Database.dart';

//ignore: must_be_immutable
class ContactsPage extends StatefulWidget {
  List<int> contactIds = [];
  final bool singleSelectMode, selectionModeOn;
  ContactsPage({Key key, this.contactIds, this.selectionModeOn = false, this.singleSelectMode = false}) : super(key: key);
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: !widget.selectionModeOn?null:AppBar(
        title: "Select Contact(s)".text.make(), centerTitle: true,
        actions: [IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            Navigator.of(context).pop(widget.contactIds,);
          },
        )],
      ),
      body: Container( 
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Contact>>(
                stream: db.getContactsStream(),
                initialData: null ,
                builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeightBox(16),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Contacts List", style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 16, fontWeight: FontWeight.w700),),
                            Text("${snapshot.data?.length??0} Contacts", style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 16, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      )
                    ),
                    HeightBox(8),            
                    if(snapshot.hasError) "Error: ${snapshot.error}".text.makeCentered()
                    else if(!snapshot.hasData) CircularProgressIndicator().box.makeCentered()
                    else if(snapshot.data.length==0) Expanded(child: "No Contacts Yet\nTap \"+ Add\" button to add new contact".text.center.makeCentered())
                    else Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length??0,
                        itemBuilder: (_, i) {
                          if(widget.selectionModeOn == false)
                            return ContactListItem(snapshot.data[i], key: ValueKey(snapshot.data[i].id), onTapCallback: () async {
                              var data = await addNewContactItemDialog(context, contact: snapshot.data[i]);
                              if(data!=null) {
                                db.addNewOrUpdateContact(data);
                                if(mounted) setState(() {});
                              }
                            },);
                          else {
                            return Container(
                              child: Stack(                        
                                fit: StackFit.loose,
                                children: [
                                  ContactListItem(snapshot.data[i], onTapCallback: () {
                                    if(widget.contactIds.contains(snapshot.data[i].id)) {
                                      print("Adding");
                                      widget.contactIds.remove(snapshot.data[i].id);
                                    }
                                    else {
                                      print("Removing");
                                      widget.contactIds.add(snapshot.data[i].id);
                                    }
                                    setState(() {});
                                  }),
                                  if(widget.contactIds.contains(snapshot.data[i].id)) Positioned(
                                    left: 8, top: 8,
                                    // alignment: Alignment.topLeft,
                                    child: Icon(Icons.check, color: isDark?Colors.black:Colors.white, size: 16).box.roundedFull.p4.color(!isDark?Colors.black:Colors.white).make(),
                                  )
                                ],
                              ),
                            );
                          }
                        } 
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add,),
      //   onPressed: () async {
      //     Contact newContact = await addNewContactItemDialog(context);
      //     print("Insert ID = "+(await db.addNewContact(newContact)).toString());
      //   },
      // ), 
    );
  }

  @override bool get wantKeepAlive => true;
}