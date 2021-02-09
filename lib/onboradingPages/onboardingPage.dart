
import 'package:farmWallet/config/navigation.dart';
import 'package:farmWallet/spec/colors.dart';
import 'package:farmWallet/spec/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/onBoardingWidget.dart';
import 'widget/pageBalls.dart';

const _kDuration = const Duration(milliseconds: 300);
const _kCurve = Curves.ease;
final _controller = new PageController();
int pageNum = 0;

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<Widget> _onboardPage = [
    OnboardingWidget(
      image: "$ONBOARDINGIMAGE3",
      msg:
          "Consectetur semper faucibus nulla magna pharetra ultrices pretium. Pharetra, enim bibendum auctor vitae iaculis. ",
      title: "Mixed Farming at Ease",
      sizedBoxTop: 37,
      left: 20,
    ),
    OnboardingWidget(
      image: "$ONBOARDINGIMAGE2",
      msg:
          "Facilisis nullam dictumst bibendum ac et facilisi nisi. Velit amet turpis urna cras. Ante varius nisl aliquam ac massa ornare.",
      title: "Smooth Mechanized Farming",
      sizedBoxTop: 37,
    ),
    OnboardingWidget(
      image: "$ONBOARDINGIMAGE1",
      msg:
          "Turpis eget tempus nunc suspendisse placerat. Nibh vitae nibh vestibulum cursus.",
      title: "All Farm Practice Covered",
      sizedBoxTop: 37,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: WHITE,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _controller,
            itemCount: _onboardPage.length,
            itemBuilder: (BuildContext context, int index) {
              return _onboardPage[index % _onboardPage.length];
            },
            onPageChanged: (index) {
              setState(() {
                pageNum = index;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450),
            child: Align(
              child: _customBottomNavigation(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: _ballsContainer(),
            ),
          ),
          // _ballsContainer()
        ],
      ),
    );
  }

  Widget _customBottomNavigation() {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          pageNum == 2
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: CupertinoButton(
                    color: PRIMARYCOLOR,
                    onPressed: () {
                      navigation(context: context, pageName: "loginpage");
                    },
                    child: Text("Get Started",
                        style: TextStyle(
                          fontSize: size.width > 600 ? 28 : 20,
                          // fontWeight: FontWeight.w500,
                          color: WHITE,
                          // fontFamily: "$FONTFAMILY",
                        )),
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: CupertinoButton(
                    color: PRIMARYCOLOR,
                    onPressed: () {
                      _controller.nextPage(
                          duration: _kDuration, curve: _kCurve);
                    },
                    child: Text("Next",
                        style: TextStyle(
                          fontSize: size.width > 600 ? 28 : 20,
                          // fontWeight: FontWeight.w500,
                          color: WHITE,
                          // fontFamily: "$FONTFAMILY",
                        )),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _ballsContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        pageNum == 0 ? ball(selected: true) : ball(),
        pageNum == 1 ? ball(selected: true) : ball(),
        pageNum == 2 ? ball(selected: true) : ball(),
      ],
    );
  }
}
