import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserPreferences {
  static final String _kLoggedIn = "loggedIn";
  static final String _kApIKey = "apiKey";
  static final String _kName = "name";
  static final String _kTagline = "tagline";
  static final String _kBaseURL = "baseURL";
  static final String _kUniqueID = "uniqueId";
  static final String _kWebURL = "webURL";
  static final String _kPrimaryColor = "primaryColor";
  static final String _kSecondaryColor = "secondaryColor";
  static final String _kMenuTextColor = "menutextcolor";
  static final String _kMenuTextHoverColor = "menutexthovercolor";
  static final String _kLogo = "logo_path";
  static final String _kUserRole = "userRole";
  static final String _kFirstApp = "firstApp";

  static final String _kFirstName = "firstname";
  static final String _kMidName = "midname";
  static final String _kLastName = "lastname";
  static final String _kUserId = "userId";

  static final String _ktitle = "title";
  static final String _kEmail = "emai;";
  static final String _kdob = "dob";
  static final String _kdobbs = "dob_bs";

  static final String _kphone = "phone";
  static final String _kmobile = "mobile;";
  static final String _kphoto = "photo";
  static final String _kToken = "token";

  static void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_kLoggedIn, false);

    prefs.remove(_kFirstName);
    prefs.remove(_kMidName);
    prefs.remove(_kLastName);
    prefs.remove(_kUserId);
    prefs.remove(_ktitle);
    prefs.remove(_kEmail);
    prefs.remove(_kdob);
    prefs.remove(_kdobbs);
    prefs.remove(_kphone);
    prefs.remove(_kmobile);
    prefs.remove(_kphoto);
    prefs.remove(_kToken);
  }

  static Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var ls;

    if (prefs.getBool(_kLoggedIn) == null) {
      ls = false;
    } else {
      ls = prefs.getBool(_kLoggedIn);
    }

    return ls;
  }

  // Setting Login Status of the user
  static Future<bool> setLoginStatus(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_kLoggedIn, value);
  }

  // ***************************************************************************
  // Setting access apiKey.
  static Future<bool> setApiKey(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kApIKey, value);
  }

  // Fetching access apiKey.
  static Future<String> getApiKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kApIKey);
  }

  // ***************************************************************************

  // School Name
  // ***************************************************************************
  static Future<bool> setSchoolName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kName, value);
  }

  static Future<String> getSchoolName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kName);
  }

  // ***************************************************************************

  // School Unique Id
  // ***************************************************************************
  static Future<bool> setUniqueId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kUniqueID, value);
  }

  static Future<String> getUniqueId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kUniqueID);
  }
  // ***************************************************************************

  // School Tagline
  // ***************************************************************************
  static Future<bool> setTagline(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kTagline, value);
  }

  static Future<String> getTagline() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kTagline);
  }
  // ***************************************************************************

  // School Tagline
  // ***************************************************************************
  static Future<bool> setBaseURL(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kBaseURL, value);
  }

  static Future<String> getBaseURL() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kBaseURL);
  }
  // ***************************************************************************

  // Web URL
  // ***************************************************************************
  static Future<bool> setWebURL(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kWebURL, value);
  }

  static Future<String> getWebURL() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kWebURL);
  }
  // ***************************************************************************

  // Primary Color
  // ***************************************************************************
  static Future<bool> setPrimaryColor(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kPrimaryColor, value);
  }

  static Future<String> getPrimaryColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kPrimaryColor);
  }
  // ***************************************************************************

  // Secondary Color
  // ***************************************************************************
  static Future<bool> setSecondaryColor(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kSecondaryColor, value);
  }

  static Future<String> getSecondaryColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kSecondaryColor);
  }
  // ***************************************************************************

  // Menu Text Color
  // ***************************************************************************
  static Future<bool> setMenuTextColor(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kMenuTextColor, value);
  }

  static Future<String> getMenuTextColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kMenuTextColor);
  }
  // ***************************************************************************

  // Menu Text Hover Color
  // ***************************************************************************
  static Future<bool> setMenuTextHoverColor(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kMenuTextHoverColor, value);
  }

  static Future<String> getMenuTextHoverColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kMenuTextHoverColor);
  }
  // ***************************************************************************

  // School Logo
  // ***************************************************************************
  static Future<bool> setSchoolLogo(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kLogo, value);
  }

  static Future<String> getSchoolLogo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kLogo);
  }
  // ***************************************************************************

  // School Name
  // ***************************************************************************
  static Future<bool> getFirstUse() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var ls;

    if (prefs.getBool(_kFirstApp) == null) {
      ls = true;
    } else {
      ls = prefs.getBool(_kFirstApp);
    }

    return ls;
  }

  static Future<bool> setFirstUse(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_kFirstApp, value);
  }

  // ***************************************************************************

  // User Role
  // ***************************************************************************
  static Future<bool> setUserRole(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kUserRole, value);
  }

  static Future<String> getUserRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kUserRole);
  }
  // ***************************************************************************

  // Title
  // ***************************************************************************
  static Future<bool> setTitle(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_ktitle, value);
  }

  static Future<String> getTitle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_ktitle);
  }
  // ***************************************************************************

  // First Name
  // ***************************************************************************
  static Future<bool> setFirstName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kFirstName, value);
  }

  static Future<String> getFirstName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kFirstName);
  }
  // ***************************************************************************

  // Mid Name
  // ***************************************************************************
  static Future<bool> setMidName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kMidName, value);
  }

  static Future<String> getMidName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kMidName);
  }
  // ***************************************************************************

  // Last Name
  // ***************************************************************************
  static Future<bool> setLastName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kLastName, value);
  }

  static Future<String> getLastName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kLastName);
  }
  // ***************************************************************************

  // Email
  // ***************************************************************************
  static Future<bool> setEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kEmail, value);
  }

  static Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kEmail);
  }
  // ***************************************************************************

  // DOB
  // ***************************************************************************
  static Future<bool> setdob(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kdob, value);
  }

  static Future<String> getdob() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kdob);
  }
  // ***************************************************************************

  // DOB BS
  // ***************************************************************************
  static Future<bool> setdobBS(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kdobbs, value);
  }

  static Future<String> getdobBS() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kdobbs);
  }
  // ***************************************************************************

  // phone
  // ***************************************************************************
  static Future<bool> setPhone(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kphone, value);
  }

  static Future<String> getPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kphone);
  }
  // ***************************************************************************

  // Mobile
  // ***************************************************************************
  static Future<bool> setMobile(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kmobile, value);
  }

  static Future<String> getMobile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kmobile);
  }
  // ***************************************************************************

  // Photo
  // ***************************************************************************
  static Future<bool> setPhoto(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kphoto, value);
  }

  static Future<String> getPhoto() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kphoto);
  }
  // ***************************************************************************

  // Photo
  // ***************************************************************************
  static Future<bool> setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kUserId, value);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kUserId);
  }
  // ***************************************************************************

  // Token
  // ***************************************************************************
  static Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kToken, value);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kToken);
  }
  // ***************************************************************************
}
