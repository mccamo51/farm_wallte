import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:farmWallet/components/alerts.dart';
import 'package:farmWallet/components/snackbar.dart';
import 'package:farmWallet/components/toast.dart';
import 'package:farmWallet/config/navigation.dart';
import 'package:farmWallet/config/helper/route.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/sharePreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'widgets/loginWidget.dart';

String userID, userName, userEmail;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _isLoading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : loginWidget(
              context: context,
              onLogin: () => _login(
                  email: _emailController.text.trim(),
                  password: _passwordController.text),
              onRegister: () =>
                  navigation(context: context, pageName: "registration"),
              fKey: _formKey,
              emailController: _emailController,
              emailFocus: null,
              passeordFocus: null,
              passwordController: _passwordController,
            ),
    );
  }

  _login({String email, String password}) async {
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          _isLoading = true;
        });
        final response = await http.post("$LOGIN", body: {
          'email': email,
          'password': password
        }).timeout(Duration(seconds: 50));
        if (response.statusCode == 200) {
          setState(() {
            _isLoading = false;
          });
          final responseData = json.decode(response.body);
          if (responseData['status'] == 'success') {
            saveBoolShare(key: "auth", data: true);
            saveStringShare(key: "userDetails", data: response.body);
            toastContainer(text: responseData['msg']);
            setState(() {
              userID = responseData['data']['user_id'];
              userName = responseData['data']['fname'];
              userEmail = responseData['data']['email'];
            });
            navigation(context: context, pageName: "home");
          } else {
            toastContainer(text: responseData['msg']);
          }
        }
      }
    } on TimeoutException catch (_) {
      setState(() {
        _isLoading = false;
      });
      exceptionAlert(
          context: context,
          message: "Please check your connection",
          title: "Connection Timeout");
    } on SocketException catch (s) {
      setState(() {
        _isLoading = false;
      });
      print(s);
      exceptionAlert(
          context: context,
          message: "No internet connection...",
          title: "Connection Error");
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
      snackBarContainer(
        context: context,
        text: "Error occured. Please try again...$e",
        key: _scaffoldKey,
        backgroundColor: PINK,
      );
    }
  }
}
