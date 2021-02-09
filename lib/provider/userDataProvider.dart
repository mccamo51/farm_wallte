import 'dart:convert';

import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/config/helper/route.dart';
import 'package:farmWallet/model/OnlineRecordModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserDataProvider extends ChangeNotifier {
  OnlineDataModel _onlineDataModel = OnlineDataModel();
  List<Data> onlineList = new List();
  bool isLoading = true;

  UserDataProvider() {
    _onlineDataModel.data = onlineList;
    notifyListeners();
  }

  setData(OnlineDataModel data) {
    if (data != null) _onlineDataModel = data;
    isLoading = false;
    notifyListeners();
  }

 

  OnlineDataModel getData() {
    return _onlineDataModel;
  }

  Future<OnlineDataModel> apiRequest() async {
    final response = await http.post("$GETDATA", body: {
      'user_id': userID,
    });
    final Map parsed = json.decode(response.body);
    OnlineDataModel onLineData = OnlineDataModel.fromJson(parsed);

    return onLineData;
  }
}
