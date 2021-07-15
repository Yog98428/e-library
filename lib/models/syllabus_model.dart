// To parse this JSON data, do
//
//     final syllabusModel = syllabusModelFromJson(jsonString);

import 'dart:convert';

List<SyllabusModel> syllabusModelFromJson(String str) =>
    List<SyllabusModel>.from(
        json.decode(str).map((x) => SyllabusModel.fromJson(x)));

String syllabusModelToJson(List<SyllabusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SyllabusModel {
  SyllabusModel({
    this.id,
    this.semester,
    this.programName,
    this.subject,
    this.subjectCode,
    this.creditHrs,
    this.addedBy,
    this.dateOfAdded,
    this.dateOfModified,
  });

  int id;
  String semester;
  String programName;
  String subject;
  String subjectCode;
  int creditHrs;
  String addedBy;
  DateTime dateOfAdded;
  DateTime dateOfModified;

  factory SyllabusModel.fromJson(Map<String, dynamic> json) => SyllabusModel(
        id: json["id"],
        semester: json["semester"],
        programName: json["program_name"],
        subject: json["subject"],
        subjectCode: json["subject_code"],
        creditHrs: json["credit_hrs"],
        addedBy: json["added_by"],
        dateOfAdded: DateTime.parse(json["date_of_added"]),
        dateOfModified: DateTime.parse(json["date_of_modified"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "semester": semester,
        "program_name": programName,
        "subject": subject,
        "subject_code": subjectCode,
        "credit_hrs": creditHrs,
        "added_by": addedBy,
        "date_of_added":
            "${dateOfAdded.year.toString().padLeft(4, '0')}-${dateOfAdded.month.toString().padLeft(2, '0')}-${dateOfAdded.day.toString().padLeft(2, '0')}",
        "date_of_modified":
            "${dateOfModified.year.toString().padLeft(4, '0')}-${dateOfModified.month.toString().padLeft(2, '0')}-${dateOfModified.day.toString().padLeft(2, '0')}",
      };
}
