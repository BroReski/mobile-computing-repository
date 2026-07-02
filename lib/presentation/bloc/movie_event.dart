import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

/// Event pertama saat aplikasi dibuka
class LoadMovies extends MovieEvent {}

/// Refresh data dari API
class RefreshMovies extends MovieEvent {}

/// Toggle Favorite
class ToggleFavorite extends MovieEvent {
  final int movieId;

  const ToggleFavorite(this.movieId);

  @override
  List<Object?> get props => [movieId];
}