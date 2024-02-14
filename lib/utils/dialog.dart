

import 'package:flutter/cupertino.dart';

import '../export_libs/export_libs.dart';

signOutDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Logging out',style: TextStyle(
          fontSize: MediaQuery.of(context).size.height/40,
          fontWeight: FontWeight.bold
        ),),
        content: Text('Are you sure?',style: TextStyle(
          fontSize: MediaQuery.of(context).size.height/40,
        ),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No',style: TextStyle(
              fontSize: MediaQuery.of(context).size.height/40
            ),),
          ),
          TextButton(
            onPressed: () {
              Auth.SignOutUser(context);
              Navigator.pushReplacementNamed(context, SignUpPage.id);
            },
            child: Text('Yes',style: TextStyle(
              fontSize: MediaQuery.of(context).size.height/40
            ),),
          )
        ],
      );
    }
  );
}
