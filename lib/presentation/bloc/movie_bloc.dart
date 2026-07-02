import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/movie_repository.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  MovieBloc(this.repository) : super(MovieInitial()) {
    on<LoadMovies>(_loadMovies);
    on<RefreshMovies>(_refreshMovies);
    on<ToggleFavorite>(_toggleFavorite);
  }

  Future<void> _loadMovies(
    LoadMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());

    try {
      final movies = await repository.getMovies();

      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _refreshMovies(
    RefreshMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());

    try {
      final movies = await repository.getMovies();

      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void _toggleFavorite(
    ToggleFavorite event,
    Emitter<MovieState> emit,
  ) {
    if (state is! MovieLoaded) return;

    final currentMovies =
        List.of((state as MovieLoaded).movies);

    final index =
        currentMovies.indexWhere(
      (movie) => movie.id == event.movieId,
    );

    if (index == -1) return;

    currentMovies[index].favorite =
        !currentMovies[index].favorite;

    emit(MovieLoaded(currentMovies));
  }
}