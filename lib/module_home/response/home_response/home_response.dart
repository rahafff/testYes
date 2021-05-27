// To parse this JSON data, do
//
//     final allUser = allUserFromJson(jsonString);

import 'dart:convert';

AllUser allUserFromJson(String str) => AllUser.fromJson(json.decode(str));

String allUserToJson(AllUser data) => json.encode(data.toJson());

class AllUser {
  AllUser({
    this.statusCode,
    this.msg,
    this.data,
  });

  String statusCode;
  String msg;
  List<Datum> data;

  factory AllUser.fromJson(Map<String, dynamic> json) => AllUser(
    statusCode: json["status_code"],
    msg: json["msg"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "msg": msg,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.userName,
    this.city,
    this.story,
    this.image,
    this.date,
    this.dateAndTime,
  });

  String userName;
  String city;
  String story;
  String image;
  Date date;
  Date dateAndTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userName: json["userName"] == null ? "username" :json["userName"] ,
    city: json["city"] == null ? "city" : json["city"],
    story: json["story"] == null ? null : json["story"],
    image: json["image"] == null ? null : json["image"],
    date: json["date"] == null ? null : Date.fromJson(json["date"]),
    dateAndTime: json["dateAndTime"] == null ? null : Date.fromJson(json["dateAndTime"]),
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "city": city == null ? null : city,
    "story": story == null ? null : story,
    "image": image == null ? null : image,
    "date": date == null ? null : date.toJson(),
    "dateAndTime": dateAndTime == null ? null : dateAndTime.toJson(),
  };
}

class Date {
  Date({
    this.timezone,
    this.offset,
    this.timestamp,
  });

  Timezone timezone;
  int offset;
  int timestamp;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    timezone: Timezone.fromJson(json["timezone"]),
    offset: json["offset"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "timezone": timezone.toJson(),
    "offset": offset,
    "timestamp": timestamp,
  };
}

class Timezone {
  Timezone({
    this.name,
    this.transitions,
    this.location,
  });

  String name;
  List<Transition> transitions;
  Location location;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    name: json["name"],
    transitions: List<Transition>.from(json["transitions"].map((x) => Transition.fromJson(x))),
    location: Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "transitions": List<dynamic>.from(transitions.map((x) => x.toJson())),
    "location": location.toJson(),
  };
}

class Location {
  Location({
    this.countryCode,
    this.latitude,
    this.longitude,
    this.comments,
  });

  String countryCode;
  int latitude;
  int longitude;
  String comments;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    countryCode: json["country_code"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "country_code": countryCode,
    "latitude": latitude,
    "longitude": longitude,
    "comments": comments,
  };
}

class Transition {
  Transition({
    this.ts,
    this.time,
    this.offset,
    this.isdst,
    this.abbr,
  });

  double ts;
  String time;
  int offset;
  bool isdst;
  String abbr;

  factory Transition.fromJson(Map<String, dynamic> json) => Transition(
    ts: json["ts"].toDouble(),
    time: json["time"],
    offset: json["offset"],
    isdst: json["isdst"],
    abbr: json["abbr"],
  );

  Map<String, dynamic> toJson() => {
    "ts": ts,
    "time": time,
    "offset": offset,
    "isdst": isdst,
    "abbr": abbr,
  };
}
