import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/auth/register/widgets/registerWidget.dart';
import 'package:farmWallet/components/alerts.dart';
import 'package:farmWallet/components/snackbar.dart';
import 'package:farmWallet/components/toast.dart';
import 'package:farmWallet/config/helper/route.dart';
import 'package:farmWallet/config/navigation.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/sharePreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  final _nameController = new TextEditingController();
  final _phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _isLoading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : registerWidget(
              formkey: _formKey,
              context: context,
              onRegister: () => _register(
                email: _emailController.text,
                name: _nameController.text,
                phone: _phoneController.text,
                password: _passwordController.text,
              ),
              emailController: _emailController,
              emailFocus: null,
              nameController: _nameController,
              nameFocus: null,
              passeordFocus: null,
              passwordController: _passwordController,
              phoneController: _phoneController,
              phoneFocus: null,
            ),
    );
  }

  _register({
    String email,
    String password,
    String name,
    String phone,
  }) async {
    if (_formKey.currentState.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        final response = await http.post("$REG", body: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
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
            print(responseData['msg']);
            toastContainer(text: responseData['msg']);
          }
        }
      } on TimeoutException catch (e) {
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
      } catch (g) {
        setState(() {
          _isLoading = false;
        });
        print(g);
        snackBarContainer(
          context: context,
          text: "Error occured. Please try again...$g",
          key: _scaffoldKey,
          backgroundColor: PINK,
        );
      }
    }
  }
}
