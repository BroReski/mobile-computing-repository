import '../datasource/movie_api_service.dart';
import '../datasource/movie_local_service.dart';
import '../../core/services/connectivity_service.dart';
import '../models/movie.dart';

class MovieRepository {
  final MovieApiService apiService;
  final MovieLocalService localService;
  final ConnectivityService connectivityService;

  MovieRepository({
    required this.apiService,
    required this.localService,
    required this.connectivityService,
  });

  Future<List<Movie>> getMovies() async {
    final hasInternet =
        await connectivityService.isConnected();

    if (hasInternet) {
      final movies =
          await apiService.getPopularMovies();

      await localService.saveMovies(movies);

      return movies;
    }

    return localService.getMovies();
  }
}