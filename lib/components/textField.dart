import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/properties.dart';
import 'package:flutter/material.dart';

Widget textFormField({
  @required String hintText,
  String labelText,
  String validateMsg,
  IconData icon,
  Color iconColor,
  Color cursorColor,
  Color textColor = BLACK,
  @required TextEditingController controller,
  bool validate = true,
  bool suggestion = false,
  TextInputType inputType = TextInputType.text,
  int maxLine = 1,
  int minLine = 1,
  bool validateEmail = false,
  double width,
  enable = true,
  bool removeBorder = false,
  void Function() onIconTap,
  TextInputAction inputAction,
  void Function() onEditingComplete,
  @required FocusNode focusNode,
}) {
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(horizontal: removeBorder ? 10 : 0),
    decoration: BoxDecoration(
        color: TEXTFIELDCOLOR, borderRadius: BorderRadius.circular(6)),
    // padding: EdgeInsets.all(3),
    child: TextFormField(
      enabled: enable,
      enableSuggestions: suggestion,
      keyboardType: inputType,
      controller: controller,
      minLines: minLine,
      maxLines: maxLine,
      focusNode: focusNode,
      autofocus: false,
      textInputAction: inputAction,
      cursorColor: cursorColor,
      style: TextStyle(
        color: textColor,
      ),
      onEditingComplete: () {
        print(controller.text);
        focusNode.unfocus();
        onEditingComplete();
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: ASHDEEP),
        labelText: labelText,
        labelStyle: TextStyle(color: ASHDEEP),
        suffixIcon: icon == null
            ? null
            : GestureDetector(
                onTap: onIconTap,
                child: Icon(icon, color: iconColor),
              ),
        enabledBorder: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: ASHDEEP, width: .5),
              ),
        focusedBorder: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: ASHDEEP, width: .5),
              ),
        border: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: ASHDEEP, width: .5),
              ),
        errorStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      validator: (value) {
        RegExp regex = new RegExp(PATTERN);
        if (value.isEmpty && validate) {
          return validateMsg;
        } else if (validateEmail && !regex.hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
    ),
  );
}

Widget textFormField2({
  @required String hintText,
  String labelText,
  String validateMsg,
  IconData icon,
  Color iconColor,
  Color cursorColor,
  Color textColor = BLACK,
  @required TextEditingController controller,
  bool validate = true,
  bool suggestion = false,
  TextInputType inputType = TextInputType.text,
  int maxLine = 1,
  int minLine = 1,
  bool validateEmail = false,
  double width,
  enable = true,
  bool removeBorder = false,
  void Function() onIconTap,
  TextInputAction inputAction,
  void Function() onEditingComplete,
  @required FocusNode focusNode,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20),
    child: Container(
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: WHITE,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: ASHDEEP, offset: Offset(0, 10), blurRadius: 20)
          ]),
      child: TextFormField(
        enabled: enable,
        enableSuggestions: suggestion,
        keyboardType: inputType,
        controller: controller,
        minLines: minLine,
        maxLines: maxLine,
        focusNode: focusNode,
        autofocus: false,
        textInputAction: inputAction,
        cursorColor: cursorColor,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        onEditingComplete: () {
          print(controller.text);
          focusNode.unfocus();
          onEditingComplete();
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(color: ASHDEEP),
          labelText: labelText,
          labelStyle: TextStyle(color: ASHDEEP),
          suffixIcon: icon == null
              ? null
              : GestureDetector(
                  onTap: onIconTap,
                  child: Icon(icon, color: iconColor),
                ),
        ),
        validator: (value) {
          RegExp regex = new RegExp(PATTERN);
          if (value.isEmpty && validate) {
            return validateMsg;
          } else if (validateEmail && !regex.hasMatch(value)) {
            return "Please enter a valid email address";
          }
          return null;
        },
      ),
    ),
  );
}

Widget textFormFieldSmall({
  // @required String hintText,
  String labelText,
  String validateMsg,
  IconData icon,
  Color iconColor,
  Color cursorColor,
  Color textColor = BLACK,
  @required TextEditingController controller,
  bool validate = true,
  bool suggestion = false,
  TextInputType inputType = TextInputType.text,
  int maxLine = 1,
  int minLine = 1,
  bool validateEmail = false,
  double width,
  enable = true,
  bool removeBorder = false,
  void Function() onIconTap,
  TextInputAction inputAction,
  void Function() onEditingComplete,
  @required FocusNode focusNode,
}) {
  return Container(
    width: width,
    color: SECONDARYCOLOR,
    padding: EdgeInsets.all(3),
    child: TextFormField(
      enabled: enable,
      enableSuggestions: suggestion,
      keyboardType: inputType,
      controller: controller,
      minLines: minLine,
      maxLines: maxLine,
      focusNode: focusNode,
      autofocus: false,
      textInputAction: inputAction,
      cursorColor: cursorColor,
      style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      onEditingComplete: () {
        print(controller.text);
        focusNode.unfocus();
        onEditingComplete();
      },
      decoration: InputDecoration(
        // hintText: hintText,
        hintStyle: TextStyle(color: ASHDEEP),
        labelText: labelText,
        labelStyle: TextStyle(color: ASHDEEP),
        suffixIcon: icon == null
            ? null
            : GestureDetector(
                onTap: onIconTap,
                child: Icon(icon, color: iconColor),
              ),
        enabledBorder: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: ASHDEEP, width: .5),
              ),
        focusedBorder: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: ASHDEEP, width: .5),
              ),
        border: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: BorderSide(color: ASHDEEP, width: .5),
              ),
        errorStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      validator: (value) {
        RegExp regex = new RegExp(PATTERN);
        if (value.isEmpty && validate) {
          return validateMsg;
        } else if (validateEmail && !regex.hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
    ),
  );
}
