// To parse this JSON data, do
//
//     final updateDataModel = updateDataModelFromJson(jsonString);

import 'dart:convert';

UpdateRequestModel updateDataModelFromJson(String str) => UpdateRequestModel.fromJson(json.decode(str));

String updateDataModelToJson(UpdateRequestModel data) => json.encode(data.toJson());

class UpdateRequestModel {
  UpdateRequestModel({
    this.name,
    this.job,
  });

  String name;
  String job;

  factory UpdateRequestModel.fromJson(Map<String, dynamic> json) => UpdateRequestModel(
    name: json["name"] == null ? null : json["name"],
    job: json["job"] == null ? null : json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "job": job == null ? null : job,
  };
}
