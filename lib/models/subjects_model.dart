// To parse this JSON data, do
//
//     final subjectsModel = subjectsModelFromJson(jsonString);

import 'dart:convert';

List<SubjectsModel> subjectsModelFromJson(String str) =>
    List<SubjectsModel>.from(
        json.decode(str).map((x) => SubjectsModel.fromJson(x)));

String subjectsModelToJson(List<SubjectsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectsModel {
  SubjectsModel({
    this.id,
    this.programName,
    this.semester,
    this.subjectName,
  });

  int id;
  String programName;
  String semester;
  String subjectName;

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        id: json["id"],
        programName: json["program_name"],
        semester: json["semester"],
        subjectName: json["subject_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "program_name": programName,
        "semester": semester,
        "subject_name": subjectName,
      };
}
