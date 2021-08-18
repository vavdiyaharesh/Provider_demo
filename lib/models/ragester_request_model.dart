// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) => json.encode(data.toJson());

class RegisterRequestModel {
  RegisterRequestModel({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "password": password == null ? null : password,
  };
}
