import 'dart:convert';

import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/spec/sharePreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> checkSession() async {
  String auth = "not auth";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey("auth")) {
    if (prefs.getBool("auth")) {
      auth = "auth";
    } else {
      if (prefs.containsKey("otpPage")) {
        if (!prefs.getBool("otpPage")) {
          auth = "otp";
        }
      } else if (prefs.containsKey("loginPage")) {
        if (!prefs.getBool("loginPage")) {
          auth = "log";
        }
      } else {
        auth = "not auth";
      }
    }
  } else {
    saveBoolShare(key: "auth", data: false);
    auth = "not auth";
  }
  // auth = false;
  await Future.delayed(Duration(seconds: 2), () async {
    //load all data here
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("userDetails")) {
      String encodedData = prefs.getString("userDetails");
      var decodeData = json.decode(encodedData);
      // print(decodeData['business_hours']['day']);
      userName = decodeData['data']['fname'];
      userID = decodeData['data']['user_id'];
      userEmail = decodeData['data']['e_mail'];
    } else {
      print("please log in now");
    }
  });
  return auth;
}
