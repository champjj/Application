import 'package:flutter/material.dart';

///////////////////////  AlertdialogBox  ////////////////////////////////////
Future<Null> dialogmsgok(BuildContext context, String head, String msg) async {
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: ListTile(
              title: Text(head),
              subtitle: Text(msg),
            ),
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('OK'))
            ],
          ));
}
//////////////////////////////////////////////////////////////////////////

/////////////////////////   showSnackBar   ///////////////////////////////////
// Future<Null> snackbar(BuildContext context, String msg) {
//   showsnackbar(String msg) =>
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
// }
//////////////////////////////////////////////////////////////////////////////
