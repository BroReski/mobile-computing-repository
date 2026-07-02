import 'package:dio/dio.dart';

import '../../core/config/api_config.dart';
import '../models/movie.dart';

class MovieApiService {
  final Dio dio = Dio();

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await dio.get(
        "${ApiConfig.baseUrl}/movie/popular",
        queryParameters: {
          "api_key": ApiConfig.apiKey,
          "language": "en-US",
          "page": 1,
        },
      );

      if (response.statusCode == 200) {
        final List results = response.data["results"];

        return results
            .map(
              (movie) => Movie.fromJson(movie),
            )
            .toList();
      }

      throw Exception("Failed Load Movie");
    } on DioException catch (e) {
      throw Exception(
        e.message,
      );
    }
  }
}