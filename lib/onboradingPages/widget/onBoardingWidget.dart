import 'package:farmWallet/spec/colors.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  final String title, msg, image;
  final double sizedBoxTop, left;

  OnboardingWidget({
    @required this.image,
    @required this.msg,
    @required this.title,
    this.sizedBoxTop = 0,
    this.left = 0,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: WHITE,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: FlatButton(
                onPressed: () {
                  // navigation(context: context, pageName: "loginpage");
                },
                child: Text("Skip",
                    style: TextStyle(
                        color: PRIMARYCOLOR, fontWeight: FontWeight.bold,fontSize: 20)),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width - 50,
                    height: MediaQuery.of(context).size.height * .40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(right: 24, left: 24),
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: sizedBoxTop),
                      Text("$title",
                          style: TextStyle(
                            fontSize: size.width > 600 ? 35 : 20,
                            fontWeight: FontWeight.bold,
                            color: BLACK,
                          )),
                      SizedBox(height: 20),
                      Text(
                        "$msg",
                        style: TextStyle(
                          fontSize: size.width > 600 ? 30 : 16,
                          fontWeight: FontWeight.w400,
                          color: ASHDEEP,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
