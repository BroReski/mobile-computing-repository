import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/movie.dart';

class MovieLocalService {
  static const String movieBox = "movies";

  Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox(movieBox);
  }

  Future<void> saveMovies(List<Movie> movies) async {
    final box = Hive.box(movieBox);

    final jsonList =
        movies.map((movie) => movie.toJson()).toList();

    await box.put(
      "movie_cache",
      jsonEncode(jsonList),
    );
  }

  List<Movie> getMovies() {
    final box = Hive.box(movieBox);

    final data = box.get("movie_cache");

    if (data == null) {
      return [];
    }

    final List decoded = jsonDecode(data);

    return decoded
        .map<Movie>(
          (json) => Movie.fromJson(json),
        )
        .toList();
  }

  Future<void> clear() async {
    final box = Hive.box(movieBox);

    await box.clear();
  }
}