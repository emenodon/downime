import 'dart:convert';

CompleteAnime completeAnimeFromJson(String str) =>
    CompleteAnime.fromJson(json.decode(str));

// String welcomeToJson(CompleteAnime data) => json.encode(data.toJson());

class CompleteAnime {
  CompleteAnime({
    required this.status,
    required this.baseUrl,
    required this.animeList,
  });

  String status;
  String baseUrl;
  List<AnimeList> animeList;

  factory CompleteAnime.fromJson(Map<String, dynamic> json) => CompleteAnime(
        status: json["status"],
        baseUrl: json["baseUrl"],
        animeList: List<AnimeList>.from(
            json["animeList"].map((x) => AnimeList.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "baseUrl": baseUrl,
  //       "animeList": List<dynamic>.from(animeList.map((x) => x.toJson())),
  //     };
}

class AnimeList {
  AnimeList({
    required this.title,
    required this.id,
    required this.thumb,
    required this.episode,
    required this.uploadedOn,
    required this.score,
    required this.link,
  });

  String title;
  String id;
  String thumb;
  String episode;
  String uploadedOn;
  double score;
  String link;

  factory AnimeList.fromJson(Map<String, dynamic> json) => AnimeList(
        title: json["title"],
        id: json["id"],
        thumb: json["thumb"],
        episode: json["episode"],
        uploadedOn: json["uploaded_on"],
        score: json["score"].toDouble(),
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "thumb": thumb,
        "episode": episode,
        "uploaded_on": uploadedOn,
        "score": score,
        "link": link,
      };
}
