import 'dart:async';
import 'dart:convert';

import 'package:farmWallet/auth/login/login.dart';
import 'package:farmWallet/components/alerts.dart';
import 'package:farmWallet/components/cachedImage.dart';
import 'package:farmWallet/components/toast.dart';
import 'package:farmWallet/config/checkConnection.dart';
import 'package:farmWallet/config/localstorage/database.dart';
import 'package:farmWallet/config/navigation.dart';
import 'package:farmWallet/config/syncData.dart';
import 'package:farmWallet/homePage/viewReport/onLineView.dart';
import 'package:farmWallet/model/OnlineRecordModel.dart';
import 'package:farmWallet/model/RecordModel.dart';
import 'package:farmWallet/provider/userDataProvider.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/images.dart';
import 'package:farmWallet/spec/sharePreference.dart';
import 'package:farmWallet/spec/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewReport/offLineView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false, _internet = false;
  String _loadingMsg = "";

  int len = 0;
  int onl = 0;
  hitApi() async {
    OnlineDataModel data =
        await Provider.of<UserDataProvider>(context, listen: false)
            .apiRequest();
    Provider.of<UserDataProvider>(context, listen: false).setData(data);
  }

  @override
  Widget build(BuildContext context) {
    dateTime();
    hitApi();
    setState(() {
      len = recordModelList.recordList.length;
    });
    return Scaffold(
      backgroundColor: WHITE,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 230,
                color: PRIMARYCOLOR,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hello, $userName",
                            style: h3WHITE,
                          ),
                          Text(
                            "Online Records: ${Provider.of<UserDataProvider>(context, listen: false).getData().data.length}",
                            style: h4White,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Good $weekDay",
                            style: h4White,
                          ),
                          Text(
                            "Offline Records: ${recordModelList.recordList.length}",
                            style: h4White,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180.0, left: 10, right: 10),
                child: Card(
                  child: Container(
                    // height: 150,
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                FlatButton(
                                    onPressed: () {
                                      navigation(
                                        context: context,
                                        pageName: "addnewrecord",
                                      );
                                    },
                                    child: Image.asset(
                                      "$ADDIMAGE",
                                      height: 64,
                                      width: 64,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Add Record")
                              ],
                            ),
                            Column(
                              children: [
                                FlatButton(
                                    onPressed: () {
                                      neverSatisfied(onLine: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OnlineView(),
                                          ),
                                        );
                                      }, offLine: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OfflineView(),
                                          ),
                                        );
                                      });
                                    },
                                    child: Image.asset("assets/view.png")),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("View Record")
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gallery",
                    style: h3Black,
                  ),
                  boxItem(context: context)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Best Farmers",
                    style: h3Black,
                  ),
                  boxItem(context: context)
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logoutDialog(context),
        child: Icon(Icons.exit_to_app),
      ),
    );
  }

  Future<void> neverSatisfied({Function onLine, Function offLine}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Connectivity'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.not_interested_outlined),
                  title: Text("Choose Offline Data"),
                  onTap: offLine,
                ),
                ListTile(
                  leading: Icon(Icons.check_box),
                  title: Text("Choose Online Data"),
                  onTap: onLine,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

boxItem({BuildContext context}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (var x in Provider.of<UserDataProvider>(context).getData().data)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 120,
                width: 120,
                // color: PRIMARYCOLOR,
                child: cachedImage(
                    context: context,
                    image: "https://gitplussandbox.com/userapi/" + x.image,
                    height: null,
                    width: null)),
          ),
      ],
    ),
  );
}
