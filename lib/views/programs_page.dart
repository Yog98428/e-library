import 'dart:convert';
import 'dart:io';

import 'package:e_library/models/notes_model.dart';
import 'package:e_library/models/programs_model.dart';
import 'package:e_library/utlis/constants.dart';
import 'package:e_library/utlis/userpreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:dio/dio.dart';

var dio = Dio();

class ProgramsPage extends StatefulWidget {
  @override
  _ProgramsPageState createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  Future<List<ProgramsModel>> _notesList;
  var dateFormatter = new DateFormat('EEE, MMM d, ' 'yy');

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _notesList = fetchNotes();
  }

  Future<List<ProgramsModel>> fetchNotes() async {
    final request = await http.get(
      "$baseURL/api/programs/",
    );

    print(request.body);

    var res = json.decode(request.body);

    print(json.encode(res).length);

    List<ProgramsModel> programs = programsModelFromJson(request.body);

    return programs;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryDark,
        title: Text(
          "Programs",
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
            AsyncSnapshot<List<ProgramsModel>> snapshot) {
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
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    margin: EdgeInsets.only(bottom: 32.0),
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
                                          ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: snapshot
                                                .data[index].semester.length,
                                            itemBuilder: (context, ind) =>
                                                Container(
                                              padding: EdgeInsets.only(
                                                bottom: 8.0,
                                              ),
                                              child: Text(
                                                snapshot
                                                    .data[index].semester[ind],
                                                style: appTextStyle(
                                                  FontWeight.normal,
                                                  14.0,
                                                  Colors.black87,
                                                ),
                                              ),
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
