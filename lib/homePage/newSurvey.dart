import 'dart:io';

import 'package:farmWallet/homePage/summary.dart';
import 'package:farmWallet/homePage/widget/addRecordWidget.dart';
import 'package:farmWallet/spec/string.dart';
import 'package:farmWallet/spec/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  FocusNode fullNameFocus, ageFocus, genderFocus, locationFocus, phoneFocus;
  String genderString;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    fullNameFocus = FocusNode();
    ageFocus = FocusNode();
    genderFocus = FocusNode();
    locationFocus = FocusNode();
    phoneFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return addRecordWidget(
        context: context,
        age: ageController,
        ageFocus: ageFocus,
        fullName: fullNameController,
        fullNameFocus: fullNameFocus,
        gender: genderController,
        genderFocus: genderFocus,
        image: _image,
        locationame: locationController,
        locationFocus: locationFocus,
        phone: phoneController,
        phoneFocus: phoneFocus,
        onCapture: () => getImage(),
        onContinue: () {
          Map<String, dynamic> data = {
            'fullname': '${fullNameController.text}',
            'age': '${ageController.text}',
            'phone': '${phoneController.text}',
            'location': '${locationController.text}',
            'image': '$_image',
            'gender': '${genderController.text}',
          };
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SummaryPage(meta: data, image: _image)));
        },
        onGender: () => _androidSelectGender(
              context: context,
              controller: genderController,
            ));
  }

  androidSelectGenderType({
    List<String> gender,
    BuildContext context,
    TextEditingController controller,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int x = 0; x < gender.length; x++) ...[
          Platform.isIOS
              ? CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (controller == genderController) {
                        genderController.text = gender[x];
                      }

                      genderString = gender[x];
                    });
                    Navigator.pop(context);
                  },
                  child: Text("${gender[x]}", style: TextStyle(fontSize: 20)),
                )
              : SimpleDialogOption(
                  onPressed: () {
                    setState(() {
                      if (controller == genderController) {
                        genderController.text = gender[x];
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: Text("${gender[x]}", style: TextStyle(fontSize: 20)),
                ),
          Divider(),
        ]
      ],
    );
  }

  Future<void> _androidSelectGender(
      {BuildContext context, TextEditingController controller}) async {
    switch (await showDialog<Object>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select a Gender', style: h5Black),
            children: <Widget>[
              androidSelectGenderType(
                gender: genderList,
                context: context,
                controller: controller,
              )
            ],
          );
        })) {
    }
  }
}
