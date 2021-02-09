import 'dart:io';

import 'package:farmWallet/components/cachedImage.dart';
import 'package:farmWallet/components/textField.dart';
import 'package:flutter/material.dart';

class ViewRecordsDetails extends StatelessWidget {
  final String fullname, gender, age, location, phone, icon;
  bool onlin = false;
  ViewRecordsDetails({
    @required this.age,
    @required this.fullname,
    @required this.gender,
    @required this.location,
    @required this.phone,
    @required this.icon,
    @required this.onlin,
  });
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    fullNameController.text = fullname;
    ageController.text = age;
    genderController.text = gender;
    locationController.text = location;
    phoneController.text = phone;
    return Scaffold(
      appBar: AppBar(
        title: Text("View Record"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.4),
                  ),
                  child: Center(
                    child: icon == null
                        ? Icon(
                            Icons.add_a_photo,
                            size: 40,
                          )
                        : onlin
                            ? Image.network("$icon", height: null, width: null)
                            : Image.file(
                                File(icon.substring(7, icon.length - 1)),
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              hintText: "$fullname",
              controller: fullNameController,
              focusNode: null,
              enable: false,
              labelText: "Fullname",
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              hintText: "$gender",
              controller: genderController,
              focusNode: null,
              enable: false,
              labelText: "Gender",
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              hintText: "$age",
              controller: ageController,
              focusNode: null,
              enable: false,
              inputType: TextInputType.number,
              labelText: "Age",
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              hintText: "$location",
              controller: locationController,
              focusNode: null,
              enable: false,
              labelText: "Location",
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              hintText: "$phone",
              controller: phoneController,
              focusNode: null,
              enable: false,
              labelText: "Phone",
              inputType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}
