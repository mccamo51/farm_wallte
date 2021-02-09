import 'dart:io';

import 'package:farmWallet/spec/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

primaryButton({Function onFunction, String title, Color color = PRIMARYCOLOR}) {
  return Platform.isIOS
      ? SizedBox(
          width: double.infinity,
          child: CupertinoButton(
            color: color,
            onPressed: onFunction,
            child: Text(
              "$title",
              style: TextStyle(
                color: color == WHITE ? BLACK : WHITE,
                fontSize: 16,
              ),
            ),
          ),
        )
      : SizedBox(
        height: 45,
          width: double.infinity,
          child: FlatButton(
            color: color,
            onPressed: onFunction,
            child: Text(
              "$title",
              style: TextStyle(
                color: color == WHITE ? BLACK : WHITE,
                fontSize: 16,
              ),
            ),
          ),
        );
}
