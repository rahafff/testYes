// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

ProfileModel profileFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.statusCode,
    this.msg,
    this.data,
  });

  String statusCode;
  String msg;
  Data data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    statusCode: json["status_code"],
    msg: json["msg"],
    data: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "msg": msg,
    "Data": data.toJson(),
  };
}

class Data {
  Data({
    this.userName,
    this.city,
    this.story,
    this.image,
    this.date,
    this.dateAndTime,
  });

  String userName;
  dynamic city;
  dynamic story;
  dynamic image;
  dynamic date;
  dynamic dateAndTime;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userName: json["userName"] ?? "hello",
    city: json["city"]?? "hello",
    story: json["story"]?? "hello",
    image: json["image"]?? "hello",
    date: json["date"]?? "hello",
    dateAndTime: json["dateAndTime"]?? "hello",
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "city": city,
    "story": story,
    "image": image,
    "date": date,
    "dateAndTime": dateAndTime,
  };
}
