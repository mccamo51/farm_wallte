import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/sharePreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> logoutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sign Out Confirmation'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to sign out from the app.'),
            ],
          ),
        ),
        actions: <Widget>[
          OutlineButton(
            borderSide: BorderSide(color: PRIMARYCOLOR),
            // highlightColor: PRIMARYCOLOR,
            highlightedBorderColor: PRIMARYCOLOR,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: TextStyle(color: PRIMARYCOLOR),
            ),
          ),
          FlatButton(
            color: PRIMARYCOLOR,
            child: Text(
              'Yes',
            ),
            onPressed: () {
              clearUser(context);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> iosDialog(BuildContext context, Function onComplete) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Background process'),
        content:
            Text('This process requires internet, to complete this process.'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Stop'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Continue'),
            onPressed: onComplete,
          ),
        ],
      );
    },
  );
}

Future<void> exceptionAlert(
    {BuildContext context, String title, String message}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('$message'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            color: PRIMARYCOLOR,
            child: Text('Try again'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> iosexceptionAlert(
    {BuildContext context, String title, String message}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Try again'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
