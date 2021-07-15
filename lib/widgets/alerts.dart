import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

errorMsg(BuildContext context, String title, String message) {
  return Flushbar(
    forwardAnimationCurve: Curves.decelerate,
    reverseAnimationCurve: Curves.easeOut,
    titleText: Text(
      title,
      style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
          letterSpacing: .5,
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    ),
    messageText: Text(
      message,
      style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
          letterSpacing: .05,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    ),
    message: message,
    duration: Duration(seconds: 3),
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.red.shade600,
  )..show(context);
}

successMsg(BuildContext context, String title, String message) {
  return Flushbar(
    forwardAnimationCurve: Curves.decelerate,
    reverseAnimationCurve: Curves.easeOut,
    titleText: Text(
      title,
      style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
          letterSpacing: .5,
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    ),
    messageText: Text(
      message,
      style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
          letterSpacing: .05,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    ),
    duration: Duration(seconds: 3),
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.green.shade600,
  )..show(context);
}

sncakbarmsg(GlobalKey<ScaffoldState> _scaffoldKey, Color primaryColor,
    Color secondaryColor, String msg) {
  return _scaffoldKey.currentState.showSnackBar(
    SnackBar(
      // duration: Duration(minutes: 1),
      content: new Row(
        children: <Widget>[
          new CircularProgressIndicator(
            backgroundColor: secondaryColor,
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              primaryColor,
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          new Text(
            msg,
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                color: Color(0xFFefefef),
                letterSpacing: .5,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
