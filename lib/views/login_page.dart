import 'dart:convert';

import 'package:e_library/Components/custom_button.dart';
import 'package:e_library/Components/entry_field.dart';
import 'package:e_library/functions/functions.dart';
import 'package:e_library/utlis/constants.dart';
import 'package:e_library/utlis/userpreferences.dart';
import 'package:e_library/views/home_page.dart';
import 'package:e_library/widgets/alerts.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CardItem {
  final String title;
  final String subtitle;
  final String image;
  final String route;

  CardItem(this.title, this.subtitle, this.image, this.route);
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // _customisation = _init();
  }

  Future _init() async {}

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Container(
                width: 180,
                child: Hero(
                  tag: "logo",
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Image.asset(
                        "assets/icons/ic_logo.png",
                        scale: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              // Text(
              //   "E-Library",
              //   style: appTextStyle(
              //     FontWeight.w600,
              //     22.0,
              //     kTextColorDark,
              //   ),
              // ),
              // SizedBox(height: 32.0),
              Text(
                "Sign In",
                style: appTextStyle(
                  FontWeight.w400,
                  20.0,
                  kTextColorDark,
                ),
              ),

              SizedBox(
                height: 16.0,
              ),

              EntryField(
                controller: _emailController,
                hint: "Username",
                textInputType: TextInputType.text,
                color: kPrimaryExtraLight,
              ),

              SizedBox(
                height: 16.0,
              ),

              EntryField(
                controller: _passwordController,
                hint: "Password",
                textInputType: TextInputType.visiblePassword,
                password: true,
                color: kPrimaryExtraLight,
                // label: getString(Strings.EMAIL_ADD),
              ),

              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 16.0,
              ),
              // CustomButton(
              //   onTap: () => widget.loginInteractor
              //       .loginWithMobile(
              //           isoCode, _emailController.text),
              // ),
              CustomButton(
                label: "Sign In",
                color: kPrimaryLight,
                onTap: (() {
                  // print(organisations);
                  // _verifySchool();
                  _userSignIn();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _userSignIn() async {
    var email = _emailController.text.trim().toString();
    var password = _passwordController.text.trim().toString();

    var snackbar = sncakbarmsg(
        _scaffoldKey, kPrimaryDark, kPrimaryExtraLight, 'Signning In');

    // if (emailVerification(email)) {
    var uri = Uri.parse('$baseURL/api/login/');

    var request = http.MultipartRequest('POST', uri)
      ..fields['username'] = email
      ..fields['password'] = password;

    request.headers.addAll({'Content-Type': 'multipart/form-data'});

    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    print(respStr);

    var jsonResponse = json.decode(respStr);

    if (jsonResponse.containsKey("token")) {
      UserPreferences.setLoginStatus(true);
      UserPreferences.setToken(jsonResponse['token']);
      // print(jsonResponse['token']);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        ModalRoute.withName('/'),
      );
    } else {
      Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeOut,
        // title: "Invalid Login",
        titleText: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "FCustomB",
          ),
        ),
        messageText: Text(
          "Invalid Credentials",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "FCustomR",
          ),
        ),
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        flushbarStyle: FlushbarStyle.FLOATING,
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red.shade600,
      )..show(context);
    }

    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => HomePage(),
    //   ),
    //   ModalRoute.withName('/'),
    // );

    //  var res = json.decode(respStr);

    //print(res);
    // } else {
    //   snackbar.close();
    //   errorMsg(context, "Invalid Email", "Please enter valid email.");
    // }
  }
}
