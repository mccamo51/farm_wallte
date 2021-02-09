import 'dart:io';

import 'package:farmWallet/components/textField.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget summaryWidget({
  Map<String, dynamic> data,
  Function onPress,
  @required Function onChange,
  @required File image,
  @required BuildContext context,
}) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          textFormField(
            hintText: "${data['fullname']}",
            controller: null,
            focusNode: null,
            enable: false,
            labelText: "${data['fullname']}",
          ),
          SizedBox(
            height: 10,
          ),
          textFormField(
            hintText: "${data['gender']}",
            controller: null,
            focusNode: null,
            enable: false,
            labelText: "${data['gender']}",
          ),
          SizedBox(
            height: 10,
          ),
          textFormField(
            hintText: "${data['age']}",
            controller: null,
            focusNode: null,
            enable: false,
            inputType: TextInputType.number,
            labelText: "${data['age']}",
          ),
          SizedBox(
            height: 10,
          ),
          textFormField(
            hintText: "${data['location']}",
            controller: null,
            focusNode: null,
            enable: false,
            labelText: "${data['location']}",
          ),
          SizedBox(
            height: 10,
          ),
          textFormField(
            hintText: "${data['phone']}",
            controller: null,
            focusNode: null,
            enable: false,
            labelText: "${data['phone']}",
            inputType: TextInputType.phone,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.4),
            ),
            child: Center(
              child: image == null
                  ? Icon(
                      Icons.add_a_photo,
                      size: 40,
                    )
                  : Image.file(image),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
                color: PRIMARYCOLOR, child: Text("Save"), onPressed: onPress),
          )
        ],
      ),
    ),
  );
}
