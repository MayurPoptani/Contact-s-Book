import 'package:contacts_app/HomePage-Pages/widgets/GroupListItem.dart';
import 'package:contacts_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:contacts_app/Database/Database.dart';

class GroupsPage extends StatefulWidget {
  GroupsPage({Key key}) : super(key: key);
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container( 
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Group>>(
                stream: db.getGroupsStream(),
                initialData: null ,
                builder: (BuildContext context, AsyncSnapshot<List<Group>> snapshot) => Column(
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
                            Text("Groups List", style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 16, fontWeight: FontWeight.w700),),
                            Text("${snapshot.data?.length??0} Groups", style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 16, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      )
                    ),
                    HeightBox(8),            
                    if(snapshot.hasError) "Error: ${snapshot.error}".text.makeCentered()
                    else if(!snapshot.hasData) CircularProgressIndicator().box.makeCentered()
                    else if(snapshot.data.length==0) Expanded(child: "No Groups Yet\nTap \"+ Add\" button to add new contact".text.center.makeCentered())
                    else Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length??0,
                        itemBuilder: (_, i) {
                          return GroupListItem(snapshot.data[i], key: ValueKey(snapshot.data[i].id),);
                          // return Container();
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