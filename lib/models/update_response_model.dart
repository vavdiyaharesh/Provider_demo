// To parse this JSON data, do
//
//     final updateResponseModel = updateResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateResponseModel updateResponseModelFromJson(String str) => UpdateResponseModel.fromJson(json.decode(str));

String updateResponseModelToJson(UpdateResponseModel data) => json.encode(data.toJson());

class UpdateResponseModel {
  UpdateResponseModel({
    this.name,
    this.job,
    this.updatedAt,
  });

  String name;
  String job;
  DateTime updatedAt;

  factory UpdateResponseModel.fromJson(Map<String, dynamic> json) => UpdateResponseModel(
    name: json["name"] == null ? null : json["name"],
    job: json["job"] == null ? null : json["job"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "job": job == null ? null : job,
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
