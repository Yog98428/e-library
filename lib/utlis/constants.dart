import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryDark = Color(0xFF0EA386);
const Color kPrimaryMedium = Color(0xFF68CBB7);
const Color kPrimaryLight = Color(0xFF82D4C4);
const Color kPrimaryExtraLight = Color(0xFFC3EAE3);

const Color kSecondaryDark = Color(0xff4453ab);
const Color kSecondaryMedium = Color(0xff6655e6);
const Color kSecondaryLight = Color(0xff7476e4);
const Color kSecondaryExtraLight = Color(0xff6c8ce4);

const Color kTextColorDark = Color(0xff3F4359);
const Color kTextColorLight = Color(0xffffffff);

const Color kCustomButtonColor = Color(0xff3563B3);

// const TextStyle appTextStyle = TextStyle();ffff

TextStyle appTextStyle(
    FontWeight fontWeight, double fontSize, Color textColor) {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: textColor,
      letterSpacing: .25,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
  // return TextStyle(
  //   fontWeight: fontWeight,
  //   fontSize: fontSize,
  //   color: textColor,
  // );
}

const String baseURL = "https://eelibrary.pythonanywhere.com";
