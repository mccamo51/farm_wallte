import 'package:farmWallet/components/cachedImage.dart';
import 'package:farmWallet/components/emptyBox.dart';
import 'package:farmWallet/homePage/viewReport/viewSurvey.dart';
import 'package:farmWallet/model/OnlineRecordModel.dart';
import 'package:farmWallet/provider/userDataProvider.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnlineView extends StatefulWidget {
  @override
  _OnlineViewState createState() => _OnlineViewState();
}

class _OnlineViewState extends State<OnlineView> {
  hitApi() async {
    OnlineDataModel data =
        await Provider.of<UserDataProvider>(context, listen: false)
            .apiRequest();
    Provider.of<UserDataProvider>(context, listen: false).setData(data);
  }

  @override
  Widget build(BuildContext context) {
    hitApi();
    var providerData = Provider.of<UserDataProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Online View"),
        centerTitle: true,
      ),
      body: providerData.getData().data.length > 0
          ? ListView.builder(
              itemCount: providerData.getData().data.length,
              itemBuilder: (context, index) {
                return tile(
                    context: context,
                    name: providerData.getData().data[index].name,
                    date: providerData.getData().data[index].date,
                    onTap: () {
                      print("https://gitplussandbox.com/userapi/" +
                          providerData.getData().data[index].image);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewRecordsDetails(
                                    onlin: true,
                                    age: providerData.getData().data[index].age,
                                    fullname:
                                        providerData.getData().data[index].name,
                                    gender: providerData
                                        .getData()
                                        .data[index]
                                        .gender,
                                    // image: null,
                                    location: providerData
                                        .getData()
                                        .data[index]
                                        .location,
                                    phone: providerData
                                        .getData()
                                        .data[index]
                                        .phone,
                                    icon:
                                        "https://gitplussandbox.com/userapi/" +
                                            providerData
                                                .getData()
                                                .data[index]
                                                .image,
                                  )));
                    },
                    img: "https://gitplussandbox.com/userapi/" +
                        providerData.getData().data[index].image);
              })
          : Center(
              child: emptyBox(context),
            ),
    );
  }
}

tile(
    {Function onTap,
    String name,
    String date,
    String img,
    BuildContext context}) {
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
        leading: Container(
          child: ClipOval(
            child: Image.network(
              "$img",
              width: 70,
              height: 70,
            ),
          ),
        ),
        title: Text("$name"),
        subtitle: Text("$date"),
      ),
    ),
  );
}
