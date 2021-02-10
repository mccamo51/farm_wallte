import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/components/toast.dart';
import 'package:farmWallet/config/helper/route.dart';
import 'package:farmWallet/config/navigation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:intl/intl.dart';

Future<String> syncRecordForm(
    Map<String, dynamic> meta, BuildContext context) async {
  try {
    final dateTime = DateFormat.yMMMMEEEEd().format(DateTime.now());

    var uri = Uri.parse("$SAVEDATA_URL");

    File _image = File(meta["image"].substring(7, meta["image"].length - 1));

    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    request.fields['name'] = "${meta["fullname"]}";
    request.fields['gender'] = meta["gender"].toString();
    request.fields['age'] = "${meta["age"]}";
    request.fields['phone'] = "${meta["phone"]}";
    request.fields['location'] = "${meta["location"]}";
    request.fields['user_id'] = "$userID";
    request.fields['date'] =
        "${meta["date"]}" == null || "${meta["date"]}" == ""
            ? dateTime
            : "${meta["date"]}";
    //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));

    String fileName = _image.path.split("/").last;
    var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));

    var length = await _image.length(); //imageFile is your image file

    // multipart that takes file
    var multipartFileSign =
        new http.MultipartFile('img', stream, length, filename: fileName);

    request.files.add(multipartFileSign);
    // print("=====================$_image");

    var response = await request.send();

    if (response.statusCode == 200) {
      response.stream.bytesToString().then((value) {
        // print("=====================$value");

        final data = json.decode(value);
        if (data['status'] == "success") {
          toastContainer(text: "successfully");
          // navigation(context: context, pageName: "home");
        }
      });
      var success = {"ok": true, "msg": "Success"};

      return "${json.encode(success)}";
    } else {
      var error = {"ok": false, "msg": "Failes"};
      return "${json.encode(error)}";
    }
  } on TimeoutException catch (t) {
    print(t);
    var error = {
      "ok": false,
      "msg": "Timeout",
    };
    return "${json.encode(error)}";
  } on SocketException catch (s) {
    print(s);
    var error = {
      "ok": false,
      "msg": "No Internet",
    };
    return "${json.encode(error)}";
  } catch (e) {
    print("error $e");
    var error = {
      "ok": false,
      "msg": "Error",
    };
    return "${json.encode(error)}";
  }
}
