import 'dart:convert';

import 'package:farmWallet/model/RecordModel.dart';
import 'package:flutter/foundation.dart';

import 'database.dart';

Future<String> submitFormOffline({
  @required String fullname,
  @required String dateCreate,
  @required String gender,
  @required String age,
  @required String image,
  @required String phone,
  @required String location,
}) async {
  try {
    var newRecord = RecordModel(
      gender: gender,
      age: age,
      date: dateCreate,
      fullname: fullname,
      image: image,
      location: location,
      phoneNumber: phone,
    );
    DBProvider.db.addOfflineRedcord(newRecord);
    getAllRecords();
    var msg = {"ok": true, "msg": "Record Saved successfully"};
    return "${json.encode(msg)}";
  } catch (e) {
    print(e);
    var error = {
      "ok": false,
      "msg": "${e.toString()}",
    };
    return "${json.encode(error)}";
  }
}
