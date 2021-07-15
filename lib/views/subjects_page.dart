import 'dart:convert';
import 'dart:io';

import 'package:e_library/models/notes_model.dart';
import 'package:e_library/models/programs_model.dart';
import 'package:e_library/models/subjects_model.dart';
import 'package:e_library/utlis/constants.dart';
import 'package:e_library/utlis/userpreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:dio/dio.dart';

var dio = Dio();

class SubjectsPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  Future<List<SubjectsModel>> _notesList;
  var dateFormatter = new DateFormat('EEE, MMM d, ' 'yy');

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _notesList = fetchNotes();
  }

  Future<List<SubjectsModel>> fetchNotes() async {
    final request = await http.get(
      "$baseURL/api/subjects/",
    );

    print(request.body);

    var res = json.decode(request.body);

    print(json.encode(res).length);

    List<SubjectsModel> subjects = subjectsModelFromJson(request.body);

    return subjects;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryDark,
        title: Text(
          "Subjects",
          style: appTextStyle(
            FontWeight.w600,
            18.0,
            Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _notesList, // async work
        builder: (BuildContext context,
            AsyncSnapshot<List<SubjectsModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        backgroundColor: kPrimaryDark,
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          kPrimaryExtraLight,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            default:
              if (snapshot.hasError) {
                return Text(snapshot.hasError.toString());
              } else {
                if (snapshot.data.length != 0) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
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
                            Container(
                              height: MediaQuery.of(context).size.height,
                              padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                bottom: 64.0,
                                top: 8.0,
                              ),
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    margin: EdgeInsets.only(bottom: 16.0),
                                    elevation: 2.5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    color: kPrimaryExtraLight,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 16.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data[index].programName,
                                            style: appTextStyle(
                                              FontWeight.w600,
                                              16.0,
                                              Colors.black87,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Semester",
                                                  style: appTextStyle(
                                                    FontWeight.w600,
                                                    14.0,
                                                    Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16.0,
                                                ),
                                                Text(
                                                  snapshot.data[index].semester,
                                                  style: appTextStyle(
                                                    FontWeight.normal,
                                                    14.0,
                                                    Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Subject",
                                                  style: appTextStyle(
                                                    FontWeight.w600,
                                                    14.0,
                                                    Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 28.0,
                                                ),
                                                Text(
                                                  snapshot
                                                      .data[index].subjectName,
                                                  style: appTextStyle(
                                                    FontWeight.normal,
                                                    14.0,
                                                    Colors.black87,
                                                  ),
                                                ),
                                              ],
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
                      ],
                    ),
                  );
                } else {
                  return Text(
                    'No data found.',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 0.5,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                    //textAlign: TextAlign.center,
                  );
                }
              }
          }
        },
      ),
    );
  }
}
