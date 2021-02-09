import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customLoadingPage({String msg = ""}) {
  return Scaffold(
    backgroundColor: WHITE.withOpacity(.7),
    body: Container(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoActivityIndicator(radius: 15),
          if (msg != null || msg != "") ...[
            SizedBox(height: 20),
            Center(
              child: Text(
                "$msg",
                style: h3Black,
                textAlign: TextAlign.center,
              ),
            ),
          ]
        ],
      )),
    ),
  );
}
