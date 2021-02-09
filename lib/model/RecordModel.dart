import 'package:farmWallet/config/localstorage/database.dart';
import 'package:flutter/foundation.dart';

class RecordModel {
  int id;
  String fullname, age, gender, location, image, phoneNumber, date;

  RecordModel({
    this.id,
    @required this.fullname,
    @required this.gender,
    @required this.phoneNumber,
    @required this.age,
    @required this.location,
    @required this.image,
    @required this.date,
  });
}

class RecordModelList {
  List<RecordModel> recordList;

  RecordModelList({@required this.recordList});
}

RecordModelList recordModelList = new RecordModelList(recordList: []);

Future<String> getAllRecords() async {
  String m;
  recordModelList.recordList.clear();
  await Future.delayed(const Duration(seconds: 1), () async {
    Future<dynamic> s = DBProvider.db.getOfflineRecords();
    s.then((value) {
      print(value);
      int len = value.length;
      for (int x = 0; x < len; ++x) {
        recordModelList.recordList.add(
          RecordModel(
            id: value[x]["id"],
            age: value[x]["age"],
            gender: value[x]["gender"],
            fullname: value[x]["fullname"],
            image: value[x]["image"],
            location: value[x]["location"],
            phoneNumber: value[x]["phone"],
            date: value[x]["createDate"],
          ),
        );
      }
    });
    m = "completed";
  });
  return m;
}
