import 'dart:async';

import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/config/navigation.dart';
import 'package:farmWallet/config/sessionCheck.dart';
import 'package:farmWallet/model/RecordModel.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/images.dart';
import 'package:flutter/material.dart';

import 'onboardingPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const delay = 3;

  @override
  void initState() {
    getAllRecords();
    super.initState();
    checkSession().then((status) {
      if (status != null && status == "auth") {
        navigation(context: context, pageName: "home");
      } else {
        print("Splash");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
    });

    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => OnboardingPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "$MAINLOGO",
                height: 200,
                width: 200,
              ),
              Text(
                "FarmWallet",
                style: TextStyle(
                  color: WHITE,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
