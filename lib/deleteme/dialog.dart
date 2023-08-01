// import 'package:flutter/material.dart';

// class Dialog extends StatelessWidget {
//   const Dialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//                     title: Text('Add a note'),
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 20.0),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 labelText: 'Title',
//                               ),
//                               onChanged: (value) {
//                                 _titleField = value;
//                               },
//                             ),
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             TextFormField(
//                               decoration: InputDecoration(
//                                   border: OutlineInputBorder(),
//                                   labelText: 'Body'),
//                               onChanged: (value) {
//                                 _bodyField = value;
//                               },
//                             ),
//                             SizedBox(height: 10.0),
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop({
//                                   'title': _titleField,
//                                   'body': _bodyField,
//                                 });
//                               },
//                               child: Text('Add'),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   );
//   }
// }