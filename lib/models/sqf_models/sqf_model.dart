// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

MusicDataModel dataModelFromJson(String str) => MusicDataModel.fromJson(json.decode(str));

String dataModelToJson(MusicDataModel data) => json.encode(data.toJson());

class MusicDataModel {
  int? id;
  String title;
  String artists;
  String producer;
  String companyDetails;
  String? releaseTime;

  MusicDataModel({
     this.id,
    required this.title,
    required this.artists,
    required this.producer,
    required this.companyDetails,
    required this.releaseTime
  });

  factory MusicDataModel.fromJson(Map<String, dynamic> json) => MusicDataModel(
    id: json['id'] as int,
    title: json["title"] ?? "",
    artists: json["artists"]?? "" ,
    producer: json["producer"] ??"",
    companyDetails: json["companyDetails "] ?? "",
    releaseTime: json["releaseTime"] as String
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title": title,
    "artists": artists,
    "producer": producer,
    "companyDetails ": companyDetails,
    "releaseTime": releaseTime
  };
}
