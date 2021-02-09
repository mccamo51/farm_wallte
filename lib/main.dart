import 'package:farmWallet/provider/userDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/OnlineRecordModel.dart';
import 'onboradingPages/splashscreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: UserDataProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}
