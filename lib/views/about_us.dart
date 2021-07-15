import 'package:e_library/utlis/constants.dart';
import 'package:e_library/utlis/userpreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardItem {
  final String title;
  final String subtitle;
  final String image;

  CardItem(this.title, this.subtitle, this.image);
}

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    super.initState();

    // _customisation = _init();
  }

  Future _init() async {}

  final List<CardItem> cards = [
    // CardItem(
    //   Strings.SYLLABUS,
    //   Strings.WHAT_TO_LEARN,
    //   Assets.syllabusIcon,
    //   PageRoutes.syllabusPage,
    // ),
    CardItem(
      "Notes",
      "View All",
      "assets/icons/notes.svg",
    ),
    CardItem(
      "Syllabus",
      "View All",
      "assets/icons/syllabus.svg",
    ),
    CardItem(
      "Programs",
      "View All",
      "assets/icons/programs.svg",
    ),
    CardItem(
      "Old Papers",
      "View All",
      "assets/icons/papers.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      // backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.asset(Assets.header),
                Container(
                  height: MediaQuery.of(context).size.height * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                    ),
                    // color: kPrimaryDark,
                  ),
                ),
                // Container(
                //   child: Text("A"),
                // ),
              ],
            ),
            Column(
              children: [
                AppBar(
                  backgroundColor: kPrimaryDark,
                  title: Text(
                    "About Us",
                    style: appTextStyle(
                      FontWeight.w600,
                      18.0,
                      Colors.white,
                    ),
                  ),
                  centerTitle: true,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    children: [
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: kPrimaryExtraLight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16.0,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            title: Text(
                              "About Us ",
                              style: appTextStyle(
                                FontWeight.bold,
                                20.0,
                                kPrimaryDark,
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                "This project E-Library Android App has been developed on API-based and Android and it’s an android programming project for us final semester BCA students. The main aim of developing this Android app is to provide study materials to our college students. Students can log in to this app and view or download the required materials. This app is specially developed as per the requirements of students of our college NAST. In this mobile application students of all programs and all semesters can get their required notes, syllabuses and old questions.",
                                style: appTextStyle(
                                  FontWeight.normal,
                                  12.0,
                                  Colors.black87,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            onTap: (() {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ProfilePage(
                              //       fetchColor(_primaryColor),
                              //       fetchColor(_secondaryColor),
                              //     ),
                              //   ),
                              // );
                            }),
                            trailing: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/icons/ic_launcher.png"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: kPrimaryExtraLight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16.0,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            title: Text(
                              "Our Teams ",
                              style: appTextStyle(
                                FontWeight.bold,
                                20.0,
                                kPrimaryDark,
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sanabul Uddin",
                                      style: appTextStyle(
                                        FontWeight.bold,
                                        14.0,
                                        Colors.black87,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      "Hem Raj Awasthi",
                                      style: appTextStyle(
                                        FontWeight.bold,
                                        14.0,
                                        Colors.black87,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      "Biswash Pant",
                                      style: appTextStyle(
                                        FontWeight.bold,
                                        14.0,
                                        Colors.black87,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      "Deepak Singh Mal",
                                      style: appTextStyle(
                                        FontWeight.bold,
                                        14.0,
                                        Colors.black87,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: (() {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ProfilePage(
                              //       fetchColor(_primaryColor),
                              //       fetchColor(_secondaryColor),
                              //     ),
                              //   ),
                              // );
                            }),
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/icons/network.png"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: kPrimaryExtraLight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16.0,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            title: Text(
                              "Contact Us ",
                              style: appTextStyle(
                                FontWeight.bold,
                                20.0,
                                kPrimaryDark,
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email_rounded,
                                          size: 16.0,
                                          color: kPrimaryDark,
                                        ),
                                        SizedBox(
                                          width: 16.0,
                                        ),
                                        Text(
                                          "solemnsanaul102@gmail.com",
                                          style: appTextStyle(
                                            FontWeight.bold,
                                            14.0,
                                            Colors.black87,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone_rounded,
                                          size: 16.0,
                                          color: kPrimaryDark,
                                        ),
                                        SizedBox(
                                          width: 16.0,
                                        ),
                                        Text(
                                          "+977 - 9843717002",
                                          style: appTextStyle(
                                            FontWeight.bold,
                                            14.0,
                                            Colors.black87,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: (() {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ProfilePage(
                              //       fetchColor(_primaryColor),
                              //       fetchColor(_secondaryColor),
                              //     ),
                              //   ),
                              // );
                            }),
                            trailing: Icon(
                              Icons.call_outlined,
                              size: 32.0,
                              color: kPrimaryDark,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                // SizedBox(
                //   height: 100,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
