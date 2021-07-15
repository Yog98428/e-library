// To parse this JSON data, do
//
//     final programsModel = programsModelFromJson(jsonString);

import 'dart:convert';

List<ProgramsModel> programsModelFromJson(String str) =>
    List<ProgramsModel>.from(
        json.decode(str).map((x) => ProgramsModel.fromJson(x)));

String programsModelToJson(List<ProgramsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgramsModel {
  ProgramsModel({
    this.id,
    this.semester,
    this.programName,
  });

  int id;
  List<String> semester;
  String programName;

  factory ProgramsModel.fromJson(Map<String, dynamic> json) => ProgramsModel(
        id: json["id"],
        semester: List<String>.from(json["semester"].map((x) => x)),
        programName: json["program_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "semester": List<dynamic>.from(semester.map((x) => x)),
        "program_name": programName,
      };
}
