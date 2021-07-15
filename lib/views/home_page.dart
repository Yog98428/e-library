import 'package:e_library/utlis/constants.dart';
import 'package:e_library/utlis/userpreferences.dart';
import 'package:e_library/views/about_us.dart';
import 'package:e_library/views/login_page.dart';
import 'package:e_library/views/notes.dart';
import 'package:e_library/views/old_paper_page.dart';
import 'package:e_library/views/programs_page.dart';
import 'package:e_library/views/subjects_page.dart';
import 'package:e_library/views/syllabus_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardItem {
  final String title;
  final String subtitle;
  final String image;

  CardItem(this.title, this.subtitle, this.image);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        backgroundColor: kPrimaryDark,
        title: Text(
          "E-Library",
          style: appTextStyle(
            FontWeight.w600,
            18.0,
            Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: (() {
              // print(_primaryColor);
              print("Notification Clicked");
              UserPreferences.logout();
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            }),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryExtraLight,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/icons/ic_logo.png",
                        width: 125.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "E-Library ",
                      style: appTextStyle(
                        FontWeight.bold,
                        20.0,
                        kPrimaryDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/home.svg",
                height: 24,
                color: kPrimaryMedium,
              ),
              title: Text(
                'Home',
                style: appTextStyle(
                  FontWeight.bold,
                  14.0,
                  kPrimaryMedium,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/notes.svg",
                height: 24,
                color: Colors.black87,
              ),
              title: Text(
                'Notes',
                style: appTextStyle(
                  FontWeight.bold,
                  14.0,
                  Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/syllabus.svg",
                height: 24,
                color: Colors.black87,
              ),
              title: Text(
                'Syllabus',
                style: appTextStyle(
                  FontWeight.bold,
                  14.0,
                  Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SyllabusPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/programs.svg",
                height: 24,
                color: Colors.black87,
              ),
              title: Text(
                'Programs',
                style: appTextStyle(
                  FontWeight.bold,
                  14.0,
                  Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgramsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/papers.svg",
                height: 24,
                color: Colors.black87,
              ),
              title: Text(
                'Old Papers',
                style: appTextStyle(
                  FontWeight.bold,
                  14.0,
                  Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OldPapersPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.list,
                color: Colors.black87,
              ),
              title: Text(
                'Subjects',
                style: appTextStyle(
                  FontWeight.bold,
                  14.0,
                  Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubjectsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/info.svg",
                height: 24,
                color: Colors.black87,
              ),
              title: Text(
                'About Us',
                style: appTextStyle(
                  FontWeight.bold,
                  14.0,
                  Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                );
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/log-out.svg",
                height: 24,
                color: Colors.black87,
              ),
              title: Text(
                'Sign Out',
                style: appTextStyle(
                  FontWeight.bold,
                  14.0,
                  Colors.black87,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: kPrimaryDark,
          // height: 900,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
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
                          color: kPrimaryMedium,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 28.0,
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              title: Text(
                                "Hello ",
                                style: appTextStyle(
                                  FontWeight.bold,
                                  20.0,
                                  kTextColorLight,
                                ),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  "NAST Student",
                                  style: appTextStyle(
                                    FontWeight.bold,
                                    20.0,
                                    kTextColorLight,
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
                              trailing: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                    "https://www.shareicon.net/data/512x512/2017/01/06/868320_people_512x512.png"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Expanded(
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: cards.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (context, index) => GestureDetector(
                              // onTap: () => Navigator.pushNamed(
                              //     context, cards[index].route),

                              onTap: (() {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NotesPage(),
                                    ),
                                  );
                                } else if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SyllabusPage(),
                                    ),
                                  );
                                } else if (index == 2) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProgramsPage(),
                                    ),
                                  );
                                } else if (index == 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OldPapersPage(),
                                    ),
                                  );
                                } else {
                                  // Navigator.pushNamed(context, cards[index].route);
                                }
                              }),
                              child: Card(
                                elevation: 2.5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: kPrimaryExtraLight,
                                // BoxDecoration(
                                //     color: kPrimaryExtraLight,
                                //     border: Border.all(
                                //       color: kPrimaryExtraLight,
                                //     ),
                                //     borderRadius: BorderRadius.all(
                                //       Radius.circular(
                                //         20,
                                //       ),
                                //     )),
                                // padding: EdgeInsets.all(16),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            cards[index].title,
                                            style: appTextStyle(
                                              FontWeight.w600,
                                              14.0,
                                              Colors.black87,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            cards[index].subtitle,
                                            style: appTextStyle(
                                              FontWeight.w600,
                                              10.0,
                                              Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      PositionedDirectional(
                                        top: 20,
                                        end: 0,
                                        child: SvgPicture.asset(
                                          cards[index].image,
                                          height: 32,
                                          color: kPrimaryDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
      ),
      // body: FutureBuilder(
      //   future: _customisation, // async work
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return Container(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Align(
      //                 alignment: Alignment.center,
      //                 child: CircularProgressIndicator(
      //                   backgroundColor: kLogoPrimaryLight,
      //                   strokeWidth: 2,
      //                   valueColor: AlwaysStoppedAnimation<Color>(
      //                     kLogoPrimaryLight,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         );
      //       default:
      //         if (snapshot.hasError) {
      //           return Text(snapshot.hasError.toString());
      //         } else {
      //           if (snapshot.data != null) {
      //             return FadedSlideAnimation(
      //               Stack(
      //                 children: [
      //                   Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       // Image.asset(Assets.header),
      //                       Container(
      //                         height: MediaQuery.of(context).size.height * 0.29,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.only(
      //                             bottomRight: Radius.circular(50.0),
      //                             bottomLeft: Radius.circular(50.0),
      //                           ),
      //                           color: fetchColor(_primaryColor),
      //                         ),
      //                       ),
      //                       // Container(
      //                       //   child: Text("A"),
      //                       // ),
      //                     ],
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.symmetric(horizontal: 20),
      //                     child: Column(
      //                       children: [
      //                         AppBar(
      //                           backgroundColor: Colors.transparent,
      //                           title: Text(
      //                             _schoolName,
      //                             style: appTextStyle(
      //                               FontWeight.w600,
      //                               18.0,
      //                               Colors.white,
      //                             ),
      //                           ),
      //                           centerTitle: true,
      //                           actions: [
      //                             IconButton(
      //                               icon: Icon(Icons.notifications),
      //                               onPressed: (() {
      //                                 print("Notification Clicked");
      //                                 Navigator.pop(context);
      //                                 Navigator.pushNamed(
      //                                   context,
      //                                   PageRoutes.notificationsPage,
      //                                 );
      //                               }),
      //                             ),
      //                             IconButton(
      //                               icon: Icon(Icons.logout),
      //                               onPressed: (() {
      //                                 print(_primaryColor);
      //                                 print("Notification Clicked");
      //                                 UserPreferences.logout();
      //                                 Navigator.pop(context);
      //                                 Navigator.push(
      //                                   context,
      //                                   MaterialPageRoute(
      //                                     builder: (context) => LoginUI(
      //                                       fetchColor(_primaryColor),
      //                                       fetchColor(_secondaryColor),
      //                                     ),
      //                                   ),
      //                                 );
      //                               }),
      //                             ),
      //                           ],
      //                         ),
      //                         ListTile(
      //                           contentPadding: EdgeInsets.zero,
      //                           title: Text(
      //                             "${getString(Strings.HELLO)}, ",
      //                             style: GoogleFonts.aBeeZee(
      //                               textStyle: TextStyle(
      //                                 letterSpacing: .5,
      //                                 fontSize: 14.0,
      //                                 fontWeight: FontWeight.w400,
      //                                 color: Colors.white,
      //                               ),
      //                             ),
      //                           ),
      //                           subtitle: Text(
      //                             _userName,
      //                             style: GoogleFonts.aBeeZee(
      //                               textStyle: TextStyle(
      //                                 letterSpacing: .5,
      //                                 fontSize: 20.0,
      //                                 fontWeight: FontWeight.w600,
      //                                 color: Colors.white,
      //                               ),
      //                             ),
      //                           ),
      //                           trailing: FadedScaleAnimation(
      //                             _userPhoto != null
      //                                 ? FutureBuilder(
      //                                     future: imageURLCheck(_userPhoto),
      //                                     builder: (context, asyncSnapshot) {
      //                                       if (asyncSnapshot.hasData) {
      //                                         if (asyncSnapshot.data) {
      //                                           return Container(
      //                                             // color: Colors.black,
      //                                             // width: 200,
      //                                             child: CircleAvatar(
      //                                               radius: 30,
      //                                               backgroundColor:
      //                                                   Colors.transparent,
      //                                               backgroundImage:
      //                                                   NetworkImage(
      //                                                       _userPhoto),
      //                                             ),
      //                                           );
      //                                         } else {
      //                                           return Container(
      //                                             // color: Colors.black,
      //                                             // width: 200,
      //                                             child: CircleAvatar(
      //                                               radius: 30,
      //                                               backgroundColor:
      //                                                   Colors.transparent,
      //                                               backgroundImage: AssetImage(
      //                                                   "assets/images/no_image.png"),
      //                                             ),
      //                                           );
      //                                         }
      //                                       } else {
      //                                         return Padding(
      //                                           padding: EdgeInsets.all(8.0),
      //                                           child: Column(
      //                                             crossAxisAlignment:
      //                                                 CrossAxisAlignment.center,
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment.center,
      //                                             children: [
      //                                               Align(
      //                                                 alignment:
      //                                                     Alignment.center,
      //                                                 child:
      //                                                     CircularProgressIndicator(
      //                                                   backgroundColor:
      //                                                       Colors.green,
      //                                                   strokeWidth: 1,
      //                                                   valueColor:
      //                                                       AlwaysStoppedAnimation<
      //                                                           Color>(
      //                                                     Colors.red,
      //                                                   ),
      //                                                 ),
      //                                               ),
      //                                             ],
      //                                           ),
      //                                         );
      //                                       }
      //                                     },
      //                                   )
      //                                 : CircleAvatar(
      //                                     radius: 30,
      //                                     backgroundColor: Colors.transparent,
      //                                     backgroundImage: AssetImage(
      //                                         "assets/images/user_d.png"),
      //                                   ),
      //                           ),
      //                           onTap: (() {
      //                             Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                 builder: (context) => ProfilePage(
      //                                   fetchColor(_primaryColor),
      //                                   fetchColor(_secondaryColor),
      //                                 ),
      //                               ),
      //                             );
      //                           }),
      //                         ),
      //                         Container(
      //                           margin: EdgeInsets.only(top: 20),
      //                           padding: EdgeInsets.all(8),
      //                           decoration: AppTheme().boxDecoration,
      //                           child: Row(
      //                             children: [
      //                               Image.asset(Assets.whatsNext,
      //                                   height: 80, width: 80),
      //                               SizedBox(width: 12),
      //                               Column(
      //                                 crossAxisAlignment:
      //                                     CrossAxisAlignment.start,
      //                                 children: [
      //                                   Text(
      //                                     context.getString(Strings.WHATS_NEXT),
      //                                     style: GoogleFonts.aBeeZee(
      //                                       textStyle: TextStyle(
      //                                         color: Colors.black38,
      //                                         letterSpacing: .5,
      //                                         fontSize: 14.0,
      //                                         fontWeight: FontWeight.w500,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   Text(
      //                                     context.getString(Strings.GEO_WEEKLY),
      //                                     style: GoogleFonts.aBeeZee(
      //                                       textStyle: TextStyle(
      //                                         color: Colors.black87,
      //                                         letterSpacing: .5,
      //                                         fontSize: 16.0,
      //                                         fontWeight: FontWeight.w600,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   SizedBox(
      //                                     height: 2.0,
      //                                   ),
      //                                   Text(
      //                                     context.getString(Strings.TWO_DAYS),
      //                                     style: GoogleFonts.aBeeZee(
      //                                       textStyle: TextStyle(
      //                                         color: Colors.black38,
      //                                         letterSpacing: .5,
      //                                         fontSize: 12.0,
      //                                         fontWeight: FontWeight.w600,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         GestureDetector(
      //                           onTap: () => Navigator.pushNamed(
      //                               context, PageRoutes.groupCallPage),
      //                           child: Container(
      //                             margin: EdgeInsets.only(top: 20),
      //                             padding: EdgeInsets.all(8),
      //                             decoration: AppTheme().boxDecoration,
      //                             child: Row(
      //                               children: [
      //                                 FadedScaleAnimation(Image.asset(
      //                                     Assets.nextClass,
      //                                     height: 80,
      //                                     width: 80)),
      //                                 SizedBox(width: 12),
      //                                 Column(
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: [
      //                                     Text(
      //                                       context
      //                                           .getString(Strings.NEXT_CLASS),
      //                                       style: GoogleFonts.aBeeZee(
      //                                         textStyle: TextStyle(
      //                                           color: Colors.black38,
      //                                           letterSpacing: .5,
      //                                           fontSize: 14.0,
      //                                           fontWeight: FontWeight.w500,
      //                                         ),
      //                                       ),
      //                                     ),
      //                                     Text(
      //                                       context
      //                                           .getString(Strings.GEO_VIDEO),
      //                                       style: GoogleFonts.aBeeZee(
      //                                         textStyle: TextStyle(
      //                                           color: Colors.black87,
      //                                           letterSpacing: .5,
      //                                           fontSize: 16.0,
      //                                           fontWeight: FontWeight.w600,
      //                                         ),
      //                                       ),
      //                                     ),
      //                                     SizedBox(
      //                                       height: 2.0,
      //                                     ),
      //                                     Text(
      //                                       'in 20:59 min',
      //                                       style: GoogleFonts.aBeeZee(
      //                                         textStyle: TextStyle(
      //                                           color: Colors.black38,
      //                                           letterSpacing: .5,
      //                                           fontSize: 12.0,
      //                                           fontWeight: FontWeight.w600,
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),

      //                         Expanded(
      //                           child: GridView.builder(
      //                             physics: BouncingScrollPhysics(),
      //                             itemCount: cards.length,
      //                             gridDelegate:
      //                                 SliverGridDelegateWithFixedCrossAxisCount(
      //                               crossAxisCount: 2,
      //                               childAspectRatio: 2,
      //                               crossAxisSpacing: 8,
      //                               mainAxisSpacing: 8,
      //                             ),
      //                             itemBuilder: (context, index) =>
      //                                 GestureDetector(
      //                               // onTap: () => Navigator.pushNamed(
      //                               //     context, cards[index].route),

      //                               onTap: (() {
      //                                 if (index == 0) {
      //                                   Navigator.push(
      //                                     context,
      //                                     MaterialPageRoute(
      //                                       builder: (context) => CalenderPage(
      //                                         fetchColor(_primaryColor),
      //                                         fetchColor(_secondaryColor),
      //                                       ),
      //                                     ),
      //                                   );
      //                                 } else if (index == 1) {
      //                                   Navigator.push(
      //                                     context,
      //                                     MaterialPageRoute(
      //                                       builder: (context) => EventsPage(
      //                                         fetchColor(_primaryColor),
      //                                         fetchColor(_secondaryColor),
      //                                       ),
      //                                     ),
      //                                   );
      //                                 } else if (index == 2) {
      //                                   Navigator.push(
      //                                     context,
      //                                     MaterialPageRoute(
      //                                       builder: (context) => ExamsPage(
      //                                         fetchColor(_primaryColor),
      //                                         fetchColor(_secondaryColor),
      //                                       ),
      //                                     ),
      //                                   );
      //                                 } else if (index == 3) {
      //                                   Navigator.push(
      //                                     context,
      //                                     MaterialPageRoute(
      //                                       builder: (context) => CoursesPage(
      //                                         fetchColor(_primaryColor),
      //                                         fetchColor(_secondaryColor),
      //                                       ),
      //                                     ),
      //                                   );
      //                                 } else {
      //                                   Navigator.pushNamed(
      //                                       context, cards[index].route);
      //                                 }
      //                               }),
      //                               child: Container(
      //                                 decoration: AppTheme().boxDecoration,
      //                                 padding: EdgeInsets.all(16),
      //                                 child: Stack(
      //                                   children: [
      //                                     Column(
      //                                       crossAxisAlignment:
      //                                           CrossAxisAlignment.start,
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.center,
      //                                       children: [
      //                                         Text(
      //                                           context.getString(
      //                                               cards[index].title),
      //                                           style: GoogleFonts.aBeeZee(
      //                                             textStyle: TextStyle(
      //                                               color: kTextColorDark,
      //                                               letterSpacing: .5,
      //                                               fontSize: 14.0,
      //                                               fontWeight: FontWeight.w700,
      //                                             ),
      //                                           ),
      //                                         ),
      //                                         SizedBox(height: 8),
      //                                         Text(
      //                                           context.getString(
      //                                               cards[index].subtitle),
      //                                           style: GoogleFonts.aBeeZee(
      //                                             textStyle: TextStyle(
      //                                               color: Colors.black45,
      //                                               letterSpacing: .5,
      //                                               fontSize: 10.0,
      //                                               fontWeight: FontWeight.w600,
      //                                             ),
      //                                           ),
      //                                         ),
      //                                       ],
      //                                     ),
      //                                     PositionedDirectional(
      //                                       top: 0,
      //                                       end: 0,
      //                                       child: FadedScaleAnimation(
      //                                         Image.asset(
      //                                           cards[index].image,
      //                                           height: 36,
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         // SizedBox(
      //                         //   height: 100,
      //                         // ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               beginOffset: Offset(0, 0.3),
      //               endOffset: Offset(0, 0),
      //               slideCurve: Curves.linearToEaseOut,
      //             );
      //           } else {
      //             return Text(
      //               'No data found.',
      //               style: TextStyle(
      //                 fontSize: 18.0,
      //                 letterSpacing: 0.5,
      //                 fontStyle: FontStyle.italic,
      //                 color: Colors.black54,
      //               ),
      //               //textAlign: TextAlign.center,
      //             );
      //           }
      //         }
      //     }
      //   },
      // ),
    );
  }
}
