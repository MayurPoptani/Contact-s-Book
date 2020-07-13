import 'package:contacts_app/Database/Database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactListItem extends StatefulWidget {
  final Contact contact;
  final Function onTapCallback;
  const ContactListItem(this.contact, {Key key, this.onTapCallback}) : super(key: key);
  @override
  _ContactListItemState createState() => _ContactListItemState();
}

class _ContactListItemState extends State<ContactListItem> {

  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
                tag: widget.contact.id,
                child: Image.asset("assets/avatars/"+((widget.contact.id)%5).toString()+".png", ),
              ),
            ),
          ),
        ),
        title: Text(widget.contact.name.toString(), 
                    style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 16, fontWeight: FontWeight.bold,),
                    softWrap: true, maxLines: 1, overflow: TextOverflow.clip, ),
        subtitle: Text(widget.contact.number,
                    style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 16, fontStyle: FontStyle.italic,),
                    softWrap: true, maxLines: 1, overflow: TextOverflow.ellipsis,),
        trailing: Text(widget.contact.gender?"Male":"Female",
                    style: TextStyle(fontFamily: GoogleFonts.latoTextTheme().toString(), fontSize: 13,),
                    softWrap: true, maxLines: 1, overflow: TextOverflow.clip,),
        onTap: () async {
          // await Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChatMessagePage(widget.chatItem)));
          // print("Refreshing Last Msg");
          if(widget.onTapCallback!=null) widget.onTapCallback();
        },
      ),
    );
  }
  
  
  @override
  void dispose() {
    super.dispose();
  }
}