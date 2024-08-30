import 'package:flutter/material.dart';
class SqfInsert{
  Widget card( {required String title,required String time,required String textw, required Column Expanded }){
    return Card(
     child: Column(
    children: [
      Text(title),
      //Expanded(child: Column(children: [Text("Music1"),Text("data")],)),
      Text(textw),
      Text(time),
      ],
    ),
    );
}
}