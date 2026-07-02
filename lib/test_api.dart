import 'services/movie_api_service.dart';

void testApi() async {
  final api = MovieApiService();

  final movies = await api.getPopularMovies();

  print(
    movies.first.title,
  );
}