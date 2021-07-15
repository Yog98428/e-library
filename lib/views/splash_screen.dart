import 'dart:async';

import 'package:e_library/utlis/userpreferences.dart';
import 'package:e_library/views/home_page.dart';
import 'package:e_library/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loginStatus;
  bool firstUseStatus;
  // Timer timer1;

  @override
  void initState() {
    super.initState();

    _loginCheck();
  }

  _loginCheck() async {
    bool loginStatus = await UserPreferences.getLoginStatus() ?? false;

    UserPreferences.setFirstUse(false);

    if (loginStatus) {
      Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        ),
      );
    } else {
      Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    // SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                //flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/ic_logo.png',
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.fill,
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
