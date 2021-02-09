import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/config/navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String humanDate, weekDay;
//saving
saveBoolShare({@required String key, @required var data}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, data);
}

saveStringShare({@required String key, @required var data}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, data);
}

//getting
Future<bool> getShareAuthData() async {
  bool ret;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey("auth")) {
    ret = prefs.getBool("auth");
  } else {
    saveBoolShare(key: "auth", data: false);
    ret = prefs.getBool("auth");
  }
  return ret;
}

clearUser(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.remove('userDetails');
  userID = "";
  userName = "";
  userEmail = "";
  saveBoolShare(key: "auth", data: false);
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false);
}

dateTime() {
  int hour;

  DateTime now = DateTime.now();
  hour = now.hour;
  humanDate = DateFormat.yMMMMEEEEd().format(now);
  if (hour < 12)
    weekDay = 'Morning';
  else if (hour >= 12 && hour < 16)
    weekDay = 'Afternoon';
  else
    weekDay = 'Evening';
}
