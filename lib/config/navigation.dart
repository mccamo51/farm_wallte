
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
    // case "rentbusfrom":
    //   Navigator.of(context, rootNavigator: true)
    //       .push(MaterialPageRoute(builder: (context) => RentBusForm()));
    //   break;
    // case "itenary":
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => Itenary()));
    //   break;
    // case "ticketing":
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => Ticketing()));
    //   break;
    // case "more":
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => More()));
    //   break;
    // case "trips":
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => MyTrips()));
    //   break;
    // case "rentbus":
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => RentBus()));
    //   break;
    // case "insurance":
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => Insurance()));
    //   break;
    // case "tickets":
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => MyTickets()));
    //   break;
    // case "authenticationpage":
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => AuthenticationPage()),
    //       (Route<dynamic> route) => false);
    //   break;
    // case "rentals":
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => MapView()));
    //   break;
    default:
      print("$pageName do not exit");
  }
}
