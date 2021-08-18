// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
  RegisterResponseModel({
    this.id,
    this.token,
  });

  int id;
  String token;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    id: json["id"] == null ? null : json["id"],
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "token": token == null ? null : token,
  };
}
