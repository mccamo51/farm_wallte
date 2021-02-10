
import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/auth/register/register.dart';
import 'package:farmWallet/homePage/homePage.dart';
import 'package:farmWallet/homePage/newSurvey.dart';
import 'package:farmWallet/homePage/viewReport/viewSurvey.dart';
import 'package:flutter/material.dart';

void navigation({
  @required BuildContext context,
  @required String pageName,
  Map<String, dynamic> meta,
}) {
  switch (pageName.toLowerCase()) {
    case "back":
      Navigator.of(context).pop();
      break;
    case "registration":
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RegisterPage()));
      break;
    case "loginpage":
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
      break;
    case "home":
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false);
      break;
    case "addnewrecord":
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AddRecord()));
      break;
    case "viewrecord":
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ViewRecordsDetails()));
      break;
    
    default:
      print("$pageName do not exit");
  }
}
