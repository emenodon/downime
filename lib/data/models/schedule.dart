import 'package:meta/meta.dart';
import 'dart:convert';

ScheduleList scheduleFromJson(String str) =>
    ScheduleList.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class ScheduleList {
  ScheduleList({
    required this.scheduleList,
  });

  List<ScheduleData> scheduleList;

  factory ScheduleList.fromJson(Map<String, dynamic> json) => ScheduleList(
        scheduleList: List<ScheduleData>.from(
            json["scheduleList"].map((x) => ScheduleData.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "scheduleList": List<dynamic>.from(scheduleList.map((x) => x.toJson())),
  //     };
}

class ScheduleData {
  ScheduleData({
    required this.day,
    required this.animeList,
  });

  String day;
  List<AnimeList> animeList;

  factory ScheduleData.fromJson(Map<String, dynamic> json) => ScheduleData(
        day: json["day"],
        animeList: List<AnimeList>.from(
            json["animeList"].map((x) => AnimeList.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "day": day,
  //       "animeList": List<dynamic>.from(animeList.map((x) => x.toJson())),
  //     };
}

class AnimeList {
  AnimeList({
    required this.animeName,
    required this.id,
    required this.link,
  });

  dynamic animeName;
  dynamic id;
  dynamic link;

  factory AnimeList.fromJson(Map<String, dynamic> json) => AnimeList(
        animeName: json["anime_name"],
        id: json["id"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "anime_name": animeName,
        "id": id,
        "link": link,
      };
}
