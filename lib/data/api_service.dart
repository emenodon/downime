import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/genre.dart';
import 'models/complete.dart';
import 'models/home.dart';
import 'models/schedule.dart';

class HomeRepo {
  static const _baseUrl = 'https://otakudesu-api.herokuapp.com/api/home';

  Future<dynamic> getData() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return Home.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Njupuk Data Cuk');
    }
  }
}

class GenreListRepo {
  static const _baseUrl = 'https://otakudesu-api.herokuapp.com/api/genres';

  Future<dynamic> getData() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return GenreList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Njupuk Data Cuk');
    }
  }
}

class CompleteAnimeRepo {
  static const _baseUrl = 'https://otakudesu-api.herokuapp.com/api/complete';

  Future<dynamic> getData() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return CompleteAnime.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Njupuk Data Cuk');
    }
  }
}

class ScheduleListRepo {
  static const _baseUrl = 'https://otakudesu-api.herokuapp.com/api/complete';

  Future<dynamic> getData() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return ScheduleList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Njupuk Data Cuk');
    }
  }
}
