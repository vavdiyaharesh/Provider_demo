// To parse this JSON data, do
//
//     final dioModel = dioModelFromJson(jsonString);

import 'dart:convert';

PostResponseModel dioModelFromJson(String str) => PostResponseModel.fromJson(json.decode(str));

String dioModelToJson(PostResponseModel data) => json.encode(data.toJson());

class PostResponseModel {
  PostResponseModel({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory PostResponseModel.fromJson(Map<String, dynamic> json) => PostResponseModel(
    name: json["name"] == null ? null : json["name"],
    job: json["job"] == null ? null : json["job"],
    id: json["id"] == null ? null : json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "job": job == null ? null : job,
    "id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
  };
}
