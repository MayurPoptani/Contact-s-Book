import 'package:contacts_app/Database/Database.dart';
import 'package:contacts_app/HomePage-Pages/functions/dialogs.dart';
import 'package:contacts_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupListItem extends StatefulWidget {
  final Group group;
  const GroupListItem(this.group, {Key key ,}) : super(key: key);
  @override
  _GroupListItemState createState() => _GroupListItemState();
}

class _GroupListItemState extends State<GroupListItem> {

  Stream<List<ContactsAndGroup>> contactsAndGroupStream;
  List<ContactsAndGroup> contactAndGroupList;
  
  @override
  void initState() {
    contactsAndGroupStream = db.getGroupMembersStream(widget.group);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: ListTile(
        leading: Container(
          width: 56, height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26, ),]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Container(
              padding: EdgeInsets.only(top: 8),
              color: Colors.white,
              child: Hero(
                tag: widget.group.id,
                child: Image.asset("assets/avatars/"+((widget.group.id)%5).toString()+".png", ),
              ),
            ),
          ),
        ),
        title: Text(widget.group.name.toString(), 
                    style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 16, fontWeight: FontWeight.bold,),
                    softWrap: true, maxLines: 1, overflow: TextOverflow.clip, ),
        subtitle: Text(widget.group.description??"Null",
                    style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 16, fontStyle: FontStyle.italic,),
                    softWrap: true, maxLines: 1, overflow: TextOverflow.ellipsis,),
        trailing: StreamBuilder(
          stream: contactsAndGroupStream ,
          initialData: null ,
          builder: (BuildContext context, AsyncSnapshot<List<ContactsAndGroup>> snapshot){
            if(snapshot.hasError) return "Error".text.make();
            else if(!snapshot.hasData) return "loading...".text.make().box.make();
            else {
              contactAndGroupList = snapshot.data;
              return Text(snapshot.data.length.toString()+" People",
                style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 13,),
                softWrap: true, maxLines: 1, overflow: TextOverflow.clip,);
            }
          },
        ),
        onTap: () async {
          print("Show Group Dialog");
          var data = await addNewGroupItemDialog(context, group: MapEntry(widget.group, contactAndGroupList.map((e) => e.contactId).toList()));
          print("Closed Group Dialog");
          if(data!=null) {
            print("Row ID = "+(await db.addNewOrUpdateGroup(data.key, data.value)).toString());
          }
        },
      ),
    );
  }
  
  
  @override
  void dispose() {
    super.dispose();
  }
}