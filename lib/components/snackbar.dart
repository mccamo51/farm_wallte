import 'package:farmWallet/spec/colors.dart';
import 'package:flutter/material.dart';

void snackBarContainer({
  @required BuildContext context,
  @required String text,
  @required GlobalKey<ScaffoldState> key,
  Color backgroundColor = BLACK,
}) {
  final snackBar = SnackBar(
    content: Text(text, textAlign: TextAlign.center),
    duration: Duration(milliseconds: 2000),
    backgroundColor: backgroundColor,
  );
  key.currentState.showSnackBar(snackBar);
}
