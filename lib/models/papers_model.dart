// To parse this JSON data, do
//
//     final papersModel = papersModelFromJson(jsonString);

import 'dart:convert';

List<PapersModel> papersModelFromJson(String str) => List<PapersModel>.from(
    json.decode(str).map((x) => PapersModel.fromJson(x)));

String papersModelToJson(List<PapersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PapersModel {
  PapersModel({
    this.id,
    this.semester,
    this.programName,
    this.subject,
    this.file,
    this.addedBy,
    this.dateOfAdded,
    this.dateOfModified,
  });

  int id;
  String semester;
  String programName;
  String subject;
  String file;
  String addedBy;
  DateTime dateOfAdded;
  DateTime dateOfModified;

  factory PapersModel.fromJson(Map<String, dynamic> json) => PapersModel(
        id: json["id"],
        semester: json["semester"],
        programName: json["program_name"],
        subject: json["subject"],
        file: json["file"],
        addedBy: json["added_by"],
        dateOfAdded: DateTime.parse(json["date_of_added"]),
        dateOfModified: DateTime.parse(json["date_of_modified"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "semester": semester,
        "program_name": programName,
        "subject": subject,
        "file": file,
        "added_by": addedBy,
        "date_of_added":
            "${dateOfAdded.year.toString().padLeft(4, '0')}-${dateOfAdded.month.toString().padLeft(2, '0')}-${dateOfAdded.day.toString().padLeft(2, '0')}",
        "date_of_modified":
            "${dateOfModified.year.toString().padLeft(4, '0')}-${dateOfModified.month.toString().padLeft(2, '0')}-${dateOfModified.day.toString().padLeft(2, '0')}",
      };
}
