import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/images.dart';
import 'package:flutter/material.dart';

Widget emptyBox(BuildContext context, {String msg = ""}) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: Image.asset(EMPTYBIG),
          ),
          Center(
              child: Text(
            "Oops, Nothing Here !\n $msg",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: ASH),
          )),
        ],
      ),
    ),
  );
}
