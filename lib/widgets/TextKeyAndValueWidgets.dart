import 'package:flutter/material.dart';

TextStyle textKeyStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.4, );
TextStyle darkTextKeyStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.4, );
TextStyle textValueStyle = TextStyle(fontSize: 14,fontWeight: FontWeight.w500, letterSpacing: 0.4);

Widget textKeyWidget(String text) => Text(text, style: textKeyStyle.copyWith(fontSize: 13, color: Colors.black45),);

Widget textValueWidget(String text, {bool clip}) {
  if(clip == null) return Text(text, style: textValueStyle.copyWith(fontSize: 13));
  else if(clip == false) return Text(text, style: textValueStyle.copyWith(fontSize: 13));
  else return Text(text, style: textValueStyle, overflow: TextOverflow.ellipsis, softWrap: true, );
}

Widget textKeyValueWidget(String key, String value, {int flex1 = 4, int flex2 = 9, EdgeInsets margin, CrossAxisAlignment crossAxisAlignment, bool clipValue}) {
  return Container(
    margin: margin??const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: Row(
      crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: flex1,
          child: Container(
            child: textKeyWidget(key),
          ),
        ),
        Expanded(
          flex: flex2,
          child: Container(
            child: textValueWidget(value, clip: clipValue??false),
          ),
        )
      ],
    ),
  );
}

Widget textKeyCustomValueWidget(String key, dynamic value, {int flex1 = 3, int flex2 = 9, EdgeInsets margin, CrossAxisAlignment crossAxisAlignment, bool clipValue}) {
  if(value is String) return textKeyValueWidget(key,value.toString(), flex1: flex1, flex2: flex2);
  else return Container(
    margin: margin??const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: flex1,
          child: Container(
            child: textKeyWidget(key),
          ),
        ),
        Expanded(
          flex: flex2,
          child: Container(
            child: value,
          ),
        )
      ],
    ),
  );
}

Widget customKeyCustomValueWidget(dynamic key, dynamic value, {int flex1 = 3, int flex2 = 9, EdgeInsets margin, CrossAxisAlignment crossAxisAlignment, bool clipValue, bool darkKey = true, bool boldKey = false}) {
  return Container(
    margin: margin??const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: Row(
      crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: flex1,
          child: Container(
            child: (key is String) ? (darkKey ? Text(key, style: boldKey?darkTextKeyStyle.copyWith(fontWeight: FontWeight.w600):darkTextKeyStyle): textKeyWidget(key,)) : key,
            // child: (key is String) ? textKeyWidget(key) : key,
          ),
        ),
        Expanded(
          flex: flex2,
          child: Container(
            child: (value is String) ? textValueWidget(value, clip: clipValue??false,) : value,
          ),
        )
      ],
    ),
  );
}


//ignore: non_constant_identifier_names
Widget HKeyValueWidget(dynamic key, dynamic value, {bool darkKey = true, EdgeInsets margin, CrossAxisAlignment crossAxisAlignment, bool clipValue, bool boldKey = false}) {
  return Container(
    margin: margin??const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          child: (key is String) ? (darkKey ? Text(key, style: boldKey?darkTextKeyStyle.copyWith(fontWeight: FontWeight.w600):darkTextKeyStyle): textKeyWidget(key,)) : key,
        ),
        Container(
          child: (value is String) ? textValueWidget(value, clip: clipValue??false) : value,
        ),
      ],
    ),
  );
}