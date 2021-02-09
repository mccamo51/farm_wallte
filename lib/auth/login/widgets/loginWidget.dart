import 'package:farmWallet/auth/register/register.dart';
import 'package:farmWallet/components/buttons.dart';
import 'package:farmWallet/components/passwordField.dart';
import 'package:farmWallet/components/textField.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget loginWidget(
    {@required BuildContext context,
    @required Function onLogin,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required FocusNode passeordFocus,
    @required FocusNode emailFocus,
    @required Key fKey,
    @required Function onRegister}) {
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
            padding: const EdgeInsets.only(left: 15.0, top: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: h1Black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome Back",
                  style: h5White,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
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
                  key: fKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      textFormField2(
                        hintText: "Email",
                        controller: emailController,
                        focusNode: emailFocus,
                        validate: true,
                        validateMsg: "Please enter a valid email",
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      PasswordField(
                        hintText: "Password",
                        controller: passwordController,
                        focusNode: passeordFocus,
                        inputType: null,
                        removeBorder: true,
                        labelText: 'Password',
                        validate: true,
                        validateMsg: 'Enter password',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: ASHDEEP),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: primaryButton(
                              onFunction: onLogin, title: "Login"))
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
                  text: 'Register',
                  style: TextStyle(
                    color: PRIMARYCOLOR,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Hellooo");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RegisterPage()));
                    }),
            ]),
          )
        ],
      ),
    ),
  );
}
