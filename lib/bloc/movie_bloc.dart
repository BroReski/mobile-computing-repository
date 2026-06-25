import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc
    extends Bloc<MovieEvent, MovieState> {

  MovieBloc(List<Map<String, dynamic>> movies)
      : super(MovieState(movies)) {

    on<ToggleFavorite>((event, emit) {

      state.movies[event.index]
      ["favorite"] =
      !state.movies[event.index]
      ["favorite"];

      emit(
        MovieState(
          List.from(state.movies),
        ),
      );
    });
  }
}