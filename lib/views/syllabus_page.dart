import 'dart:convert';
import 'package:e_library/models/syllabus_model.dart';
import 'package:e_library/utlis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

var dio = Dio();

class SyllabusPage extends StatefulWidget {
  @override
  _SyllabusPageState createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
  Future<List<SyllabusModel>> _notesList;
  var dateFormatter = new DateFormat('EEE, MMM d, ' 'yy');

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // _customisation = _init();
    // getPermission();

    _notesList = fetchSyllabus();
  }

  Future<List<SyllabusModel>> fetchSyllabus() async {
    final request = await http.get(
      "$baseURL/api/syllabus/",
    );

    print(request.body);

    var res = json.decode(request.body);

    print(json.encode(res).length);

    List<SyllabusModel> notes = syllabusModelFromJson(request.body);

    return notes;
  }

  // Future _init() async {}

  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    print(permissions);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryDark,
        title: Text(
          "Syllabus",
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
            AsyncSnapshot<List<SyllabusModel>> snapshot) {
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
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 2.5,
                            margin: EdgeInsets.only(bottom: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: kPrimaryExtraLight,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              "Program",
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
                                              snapshot.data[index].programName,
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
                                              width: 16.0,
                                            ),
                                            Text(
                                              snapshot.data[index].subject,
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
                                              "Subject Code",
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
                                              snapshot.data[index].subjectCode,
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
                                              "Credit Hours",
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
                                              snapshot.data[index].creditHrs
                                                  .toString(),
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
                                              "Added On",
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
                                              dateFormatter
                                                  .format(snapshot
                                                      .data[index].dateOfAdded)
                                                  .toString(),
                                              style: appTextStyle(
                                                FontWeight.normal,
                                                14.0,
                                                Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
