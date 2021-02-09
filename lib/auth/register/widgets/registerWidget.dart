import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/components/buttons.dart';
import 'package:farmWallet/components/passwordField.dart';
import 'package:farmWallet/components/textField.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget registerWidget({
  @required BuildContext context,
  Key formkey,
  @required TextEditingController emailController,
  @required TextEditingController phoneController,
  @required TextEditingController nameController,
  @required TextEditingController passwordController,
  @required FocusNode passeordFocus,
  @required FocusNode emailFocus,
  @required FocusNode nameFocus,
  @required FocusNode phoneFocus,
  @required Function onRegister,
}) {
  return Scaffold(
    body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        PRIMARYCOLOR,
        SECONDARYCOLOR,
      ], begin: Alignment.topCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: h1Black,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: WHITE,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      textFormField2(
                          hintText: "Enter Full Name",
                          controller: nameController,
                          focusNode: nameFocus,
                          labelText: "Fullname"),
                      SizedBox(
                        height: 30,
                      ),
                      textFormField2(
                          hintText: "Enter Email",
                          controller: emailController,
                          focusNode: emailFocus,
                          labelText: "Email",
                          validateEmail: true),
                      SizedBox(
                        height: 30,
                      ),
                      textFormField2(
                          hintText: "Enter Phone number",
                          controller: phoneController,
                          focusNode: phoneFocus,
                          labelText: "Phone number",
                          inputType: TextInputType.phone),
                      SizedBox(
                        height: 30,
                      ),
                      PasswordField(
                        hintText: "Enter Password",
                        controller: passwordController,
                        focusNode: passeordFocus,
                        inputType: null,
                        removeBorder: true,
                        validate: true,
                        labelText: 'Password',
                        validateMsg: 'Please enter password',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: primaryButton(
                          onFunction: onRegister,
                          title: "Register",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Container(
      color: WHITE,
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Don’t have an account? ',
                style: TextStyle(color: BLACK),
              ),
              TextSpan(
                  text: 'Login',
                  style: TextStyle(
                    color: PRIMARYCOLOR,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()));
                    }),
            ]),
          )
        ],
      ),
    ),
  );
}
