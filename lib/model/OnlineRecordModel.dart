class OnlineDataModel {
  String status;
  String msg;
  List<Data> data;

  OnlineDataModel({this.status, this.msg, this.data});

  OnlineDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String userId;
  String name;
  String age;
  String gender;
  String location;
  String phone;
  String image;
  String date;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.age,
      this.gender,
      this.location,
      this.phone,
      this.image,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    location = json['location'];
    phone = json['phone'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['date'] = this.date;
    return data;
  }
}
