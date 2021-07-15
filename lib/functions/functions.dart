import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> imageURLCheck(String url) async {
  final response = await http.head(url);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Color fetchColor(String colorCode) {
  var color = colorCode.replaceAll('#', '');
  var co = "0xff$color";

  return Color(int.parse(co));
}

bool emailVerification(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
