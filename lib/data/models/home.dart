import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

// String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  Home({
    required this.status,
    required this.baseUrl,
    required this.home,
  });

  dynamic status;
  dynamic baseUrl;
  HomeClass home;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        status: json["status"],
        baseUrl: json["baseUrl"],
        home: HomeClass.fromJson(json["home"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "baseUrl": baseUrl,
        "home": home.toJson(),
      };
}

class HomeClass {
  HomeClass({
    required this.onGoing,
    required this.complete,
  });

  List<Complete> onGoing;
  List<Complete> complete;

  factory HomeClass.fromJson(Map<String, dynamic> json) => HomeClass(
        onGoing: List<Complete>.from(
            json["on_going"].map((x) => Complete.fromJson(x))),
        complete: List<Complete>.from(
            json["complete"].map((x) => Complete.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "on_going": List<dynamic>.from(onGoing.map((x) => x.toJson())),
        "complete": List<dynamic>.from(complete.map((x) => x.toJson())),
      };
}

class Complete {
  Complete({
    required this.title,
    required this.id,
    required this.thumb,
    required this.episode,
    required this.uploadedOn,
    required this.score,
    required this.link,
    required this.dayUpdated,
  });

  dynamic title;
  dynamic id;
  dynamic thumb;
  dynamic episode;
  dynamic uploadedOn;
  dynamic score;
  dynamic link;
  dynamic dayUpdated;

  factory Complete.fromJson(Map<String, dynamic> json) => Complete(
        title: json["title"],
        id: json["id"],
        thumb: json["thumb"],
        episode: json["episode"],
        uploadedOn: json["uploaded_on"],
        score: json["score"] == null ? null : json["score"].toDouble(),
        link: json["link"],
        dayUpdated: json["day_updated"] == null
            ? null
            : dayUpdatedValues.map[json["day_updated"]],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "thumb": thumb,
        "episode": episode,
        "uploaded_on": uploadedOn,
        "score": score == null ? null : score,
        "link": link,
        "day_updated":
            dayUpdated == null ? null : dayUpdatedValues.reverse[dayUpdated],
      };
}

enum dayUpdated { MINGGU, SABTU }

final dayUpdatedValues =
    EnumValues({"Minggu": dayUpdated.MINGGU, "Sabtu": dayUpdated.SABTU});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
