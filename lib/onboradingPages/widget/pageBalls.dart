import 'package:farmWallet/spec/colors.dart';
import 'package:flutter/material.dart';

Widget ball({bool selected = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipOval(
      child: AnimatedContainer(
        color: selected ? PRIMARYCOLOR : BLACK.withOpacity(0.7),
        width: 7,
        height: 7,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
    ),
  );
}

Widget rectangle({bool selected = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      child: AnimatedContainer(
        color: selected ? PRIMARYCOLOR : BLACK.withOpacity(.7),
        width: 40,
        height: 5,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
    ),
  );
}
