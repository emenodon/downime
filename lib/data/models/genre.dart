import 'dart:convert';

GenreList genreListFromJson(String str) => GenreList.fromJson(json.decode(str));

// String genreListToJson(GenreList data) => json.encode(data.toJson());

class GenreList {
  GenreList({
    required this.status,
    required this.data,
  });

  dynamic status;
  List<Data> data;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        status: json['success'],
        data: List<Data>.from(json["genreList"].map((x) => Data.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "genreList": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class Data {
  Data({
    required this.genreName,
    required this.id,
    required this.link,
    required this.imageLink,
  });

  dynamic genreName;
  dynamic id;
  dynamic link;
  dynamic imageLink;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        genreName: json["genre_name"],
        id: json["id"],
        link: json["link"],
        imageLink: json["image_link"],
      );

  Map<String, dynamic> toJson() => {
        "genre_name": genreName,
        "id": id,
        "link": link,
        "image_link": imageLink,
      };
}
