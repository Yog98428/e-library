import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_library/models/papers_model.dart';
import 'package:e_library/models/programs_model.dart';
import 'package:e_library/utlis/constants.dart';
import 'package:e_library/utlis/userpreferences.dart';
import 'package:e_library/widgets/alerts.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

var dio = Dio();

class OldPapersPage extends StatefulWidget {
  @override
  _OldPapersPageState createState() => _OldPapersPageState();
}

class _OldPapersPageState extends State<OldPapersPage> {
  Future<List<PapersModel>> _notesList;
  var dateFormatter = new DateFormat('EEE, MMM d, ' 'yy');

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // _customisation = _init();
    getPermission();

    _notesList = fetchNotes();
  }

  // @override
  // void initState() {
  //   super.initState();

  //   _note
  //sList = fetchNotes();
  // }

  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    print(permissions);
  }

  Future<List<PapersModel>> fetchNotes() async {
    final request = await http.get(
      "$baseURL/api/papers/",
    );

    print(request.body);

    var res = json.decode(request.body);

    print(json.encode(res).length);

    List<PapersModel> papers = papersModelFromJson(request.body);

    return papers;
  }

  Future download2(String url, String savePath) async {
    var snackbar = sncakbarmsg(
        _scaffoldKey, kPrimaryDark, kPrimaryExtraLight, 'Downloading...');

    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
      snackbar.close();

      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          // duration: Duration(minutes: 1),
          content: Text(
            "File has been downloaded in the directory $savePath",
            style: appTextStyle(
              FontWeight.normal,
              16.0,
              Color(0xffefefef),
            ),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryDark,
        title: Text(
          "Old Papers",
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
        builder:
            (BuildContext context, AsyncSnapshot<List<PapersModel>> snapshot) {
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
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data[index].programName,
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
                                                      snapshot
                                                          .data[index].semester,
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
                                                      snapshot.data[index]
                                                          .programName,
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
                                                              .data[index]
                                                              .dateOfAdded)
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
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (() async {
                                                        print("a");
                                                        String path = await ExtStorage
                                                            .getExternalStoragePublicDirectory(
                                                                ExtStorage
                                                                    .DIRECTORY_DOWNLOADS);
                                                        //String fullPath = tempDir.path + "/boo2.pdf'";

                                                        List<String> wordList =
                                                            snapshot.data[index]
                                                                .file
                                                                .split("/");
                                                        String fullPath =
                                                            "$path/${wordList[5]}";
                                                        print(
                                                            'full path ${wordList}');

                                                        download2(
                                                            snapshot.data[index]
                                                                .file,
                                                            fullPath);
                                                      }),
                                                      child: Icon(
                                                        Icons.download_sharp,
                                                        color: kPrimaryDark,
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
