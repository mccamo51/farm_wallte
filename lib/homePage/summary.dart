import 'dart:async';
import 'dart:convert';

import 'package:farmWallet/components/customLoading.dart';
import 'package:farmWallet/components/toast.dart';
import 'package:farmWallet/config/checkConnection.dart';
import 'package:farmWallet/config/localstorage/addData.dart';
import 'package:farmWallet/config/navigation.dart';
import 'package:farmWallet/config/syncData.dart';
import 'package:farmWallet/model/RecordModel.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widget/sammryWidget.dart';

class SummaryPage extends StatefulWidget {
  final Map<String, dynamic> meta;
  final image;

  SummaryPage({@required this.meta, this.image});

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Summary"),
      ),
      body: Stack(
        children: [
          summaryWidget(
            data: widget.meta,
            onPress: () => _checkInternet(context),
            context: context,
            onChange: () => navigation(context: context, pageName: "back"),
            image: widget.image,
          ),
          if (_isLoading) customLoadingPage(),
        ],
      ),
    );
  }

  Future<void> _checkInternet(BuildContext context) async {
    await checkConnection().then((value) {
      if (value)
        _onSubmit(context);
        
      else {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                contentTextStyle: TextStyle(color: BLACK),
                title: Text(
                  'Offline',
                  style: TextStyle(color: BLACK),
                ),
                content: Text(
                    'Your device is currently offline, you can proceed to add data offline and later sync online.'),
                actions: <Widget>[
                  FlatButton(
                    textColor: PRIMARYCOLOR,
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      "Cancel",
                    ),
                  ),
                  SizedBox(height: 16),
                  FlatButton(
                    textColor: PRIMARYCOLOR,
                    onPressed: () => _onfflineSubmit(),
                    child: Text(
                      "Sumbit Offline",
                    ),
                  ),
                ],
              ),
            ) ??
            false;
      }
    });
  }

  void _onfflineSubmit() {
    Navigator.of(context).pop(false);
    setState(() {
      _isLoading = true;
    });
    final dateTime = DateFormat.yMMMMEEEEd().format(DateTime.now());
    Timer(const Duration(seconds: 1), () {
      submitFormOffline(
        age: "${widget.meta["age"]}",
        dateCreate: dateTime,
        fullname: "${widget.meta["fullname"]}",
        gender: "${widget.meta["gender"]}",
        image: "${widget.meta["image"]}",
        location: "${widget.meta["location"]}",
        phone: "${widget.meta["phone"]}",
      ).then((value) {
        setState(() {
          _isLoading = false;
        });
        toastContainer(
          text: "Offline data save successfully...",
          backgroundColor: PRIMARYCOLOR,
        );

        // navigation(context: context, pageName: "home");
        getAllRecords().whenComplete(() {
          recordModelList.recordList.clear();
          navigation(context: context, pageName: "home");
        });
      });
    });
  }

  Future<void> _onSubmit(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    syncRecordForm(widget.meta, context).then((value) async {
      Map<String, dynamic> decodeData = json.decode(value);
      if (decodeData["ok"]) {
        setState(() => _isLoading = false);
        toastContainer(
          text: decodeData['msg'],
          backgroundColor: PRIMARYCOLOR,
        );
        navigation(context: context, pageName: "homepage");

        await getAllRecords();
      } else {
        setState(() => _isLoading = false);
        toastContainer(
          text: decodeData['msg'],
          backgroundColor: Colors.red,
        );
      }
    });
  }
}
