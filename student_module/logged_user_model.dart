// To parse this JSON data, do
//
// final loggedUserModel = loggedUserModelFromJson(jsonString);

import 'dart:convert';

LoggedUserModel loggedUserModelFromJson(String str) =>
    LoggedUserModel.fromJson(json.decode(str));

String loggedUserModelToJson(LoggedUserModel data) =>
    json.encode(data.toJson());

class LoggedUserModel {
  User user;
  String token;

  LoggedUserModel({
    required this.user,
    required this.token,
  });

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) =>
      LoggedUserModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  int id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
