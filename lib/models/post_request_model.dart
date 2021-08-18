// To parse this JSON data, do
//
//     final dioModel = dioModelFromJson(jsonString);

import 'dart:convert';

PostRequestModel dioModelFromJson(String str) => PostRequestModel.fromJson(json.decode(str));

String dioModelToJson(PostRequestModel data) => json.encode(data.toJson());

class PostRequestModel {
  PostRequestModel({
    this.name,
    this.job,
  });

  String name;
  String job;

  factory PostRequestModel.fromJson(Map<String, dynamic> json) => PostRequestModel(
    name: json["name"] == null ? null : json["name"],
    job: json["job"] == null ? null : json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "job": job == null ? null : job,
  };
}
