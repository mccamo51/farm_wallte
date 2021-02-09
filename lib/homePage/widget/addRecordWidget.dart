import 'dart:io';

import 'package:farmWallet/components/textField.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget addRecordWidget({
  BuildContext context,
  @required TextEditingController fullName,
  @required TextEditingController gender,
  @required TextEditingController age,
  @required TextEditingController locationame,
  @required TextEditingController phone,
  // @required String image,
  @required FocusNode ageFocus,
  @required FocusNode genderFocus,
  @required FocusNode fullNameFocus,
  @required FocusNode locationFocus,
  @required FocusNode phoneFocus,
  @required Function onCapture,
  @required Function onGender,
  @required Function onContinue,
  @required File image,
}) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Add Record"),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            textFormField(
              hintText: "Enter Fullname",
              controller: fullName,
              focusNode: fullNameFocus,
              labelText: "Fullname",
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onGender,
              child: textFormField(
                hintText: "Select Gender",
                controller: gender,
                focusNode: genderFocus,
                enable: false,
                labelText: "Gender",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              hintText: "Enter Age",
              controller: age,
              focusNode: ageFocus,
              inputType: TextInputType.number,
              labelText: "Age",
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              hintText: "Enter Location",
              controller: locationame,
              focusNode: locationFocus,
              labelText: "Location",
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              hintText: "Enter Phone Number",
              controller: phone,
              focusNode: null,
              labelText: "Phone Number",
              inputType: TextInputType.phone,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: onCapture,
                child: Container(
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
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: PRIMARYCOLOR,
                child: Text("Summary"),
                onPressed: onContinue,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
