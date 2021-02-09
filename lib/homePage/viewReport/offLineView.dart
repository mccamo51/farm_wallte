import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:farmWallet/components/emptyBox.dart';
import 'package:farmWallet/components/toast.dart';
import 'package:farmWallet/config/localstorage/database.dart';
import 'package:farmWallet/config/navigation.dart';
import 'package:farmWallet/config/syncData.dart';
import 'package:farmWallet/model/RecordModel.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'viewSurvey.dart';

class OfflineView extends StatefulWidget {
  @override
  _OfflineViewState createState() => _OfflineViewState();
}

class _OfflineViewState extends State<OfflineView> {
  bool _isLoading = false, _isEmpty = false;
  String _loadingMsg = "";

  initState() {
    super.initState();
    for (var _ in recordModelList.recordList) {
      _isEmpty = false;
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // getAllRecords();
    return Scaffold(
        appBar: AppBar(
          title: Text("Offline View"),
          centerTitle: true,
          actions: [
            FlatButton.icon(
                icon: Icon(
                  Icons.sync,
                  color: WHITE,
                ),
                onPressed: () {
                  // getAllRecords().whenComplete(() {
                  syncRecord(context);
                  // });
                },
                label: Text(
                  "Sync All",
                  style: TextStyle(color: WHITE),
                ))
          ],
        ),
        body: _isLoading
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : _mainContent());
  }

  Widget _mainContent() {
    return SingleChildScrollView(
        child: Column(
      children: [
        if (_isEmpty || recordModelList.recordList.length == 0)
          Container(child: emptyBox(context, msg: "No record saved")),
        if (recordModelList.recordList.length > 0)
          for (var data in recordModelList.recordList)
            tile(
                date: data.date,
                name: data.fullname,
                img: data.image == null || data.image == "" ? null : data.image,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewRecordsDetails(
                                onlin: false,
                                age: data.age,
                                fullname: data.fullname,
                                gender: data.gender,
                                // image: null,
                                location: data.location,
                                phone: data.phoneNumber,
                                icon: data.image,
                              )));
                },
                onSync: () {
                  _onSync({
                    "fullname": data.fullname,
                    "gender": data.gender,
                    "age": data.age,
                    "location": data.location,
                    "phone": data.phoneNumber,
                    "image": data.image,
                    "date": data.date,
                    "id": data.id.toString()
                  }, context)
                      .whenComplete(() => getAllRecords());
                }),
      ],
    ));
  }

  Future<void> _onSync(Map<String, dynamic> meta, BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    Map<String, dynamic> newMeta = {
      "fullname": meta["fullname"],
      "gender": meta["gender"],
      "age": meta["age"],
      "location": meta["location"],
      "phone": meta["phone"],
      "image": meta["image"],
      "date": meta["date"],
    };
    await syncRecordForm(newMeta, context).then((value) {
      Map<String, dynamic> decodeData = json.decode(value);
      print(decodeData);
      if (decodeData["ok"] == true) {
        //deleting data
        DBProvider.db.deleteOfflineRecord(int.parse(meta["id"].toString()));
        setState(() => _isLoading = false);
        navigation(context: context, pageName: "homepage");
        toastContainer(
          text: decodeData['msg'],
          backgroundColor: PRIMARYCOLOR,
        );
      } else {
        setState(() => _isLoading = false);
        toastContainer(
          text: decodeData['msg'],
          backgroundColor: Colors.red,
        );
      }
    });
  }

  void syncRecord(BuildContext context) {
    _isLoading = true;
    int len = recordModelList.recordList.length;
    int count = 0;
    setState(() {
      _loadingMsg = "Syncing Case $count / $len";
    });
    for (var data in recordModelList.recordList) {
      Timer(const Duration(seconds: 2), () async {
        Map<String, dynamic> newMeta = {
          "fullname": data.fullname,
          "age": data.age,
          "gender": data.gender,
          "location": data.location,
          "image": data.image,
          "phone": data.phoneNumber,
          "date": data.date,
        };
        await syncRecordForm(newMeta, context).then((value) {
          Map<String, dynamic> decodeData = json.decode(value);
          if (decodeData["ok"] == true) {
            //deleting data
            DBProvider.db.deleteOfflineRecord(int.parse(data.id.toString()));
            ++count;
            setState(() {
              _loadingMsg = "Syncing Case $count / $len";
            });
            if (len == count) {
              setState(() {
                _isLoading = false;
              });
              toastContainer(
                  text: "$len file(s) sync successfully",
                  backgroundColor: PRIMARYCOLOR);
              navigation(context: context, pageName: "home");
            }
          } else {
            setState(() => _isLoading = false);
            toastContainer(
              text: decodeData['msg'],
              backgroundColor: Colors.red,
            );
          }
        });
      });
    }
  }
}

tile({Function onTap, String name, String date, Function onSync, String img}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.5,
            color: PRIMARYCOLOR,
          )),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 35,
          backgroundImage: FileImage(File(img.substring(7, img.length - 1))),
        ),
        title: Text("$name"),
        subtitle: Text("$date"),
        trailing: IconButton(
          icon: Icon(Icons.sync),
          onPressed: onSync,
        ),
      ),
    ),
  );
}
