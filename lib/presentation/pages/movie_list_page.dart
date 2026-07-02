import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';

import '../widget/movie_card.dart';
import '../widget/loading_widget.dart';
import '../widget/error_widget.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  void initState() {
    super.initState();

    // Meminta data film saat halaman pertama kali dibuka
    context.read<MovieBloc>().add(
          LoadMovies(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Catalog"),
      ),

      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          // ======================
          // Loading
          // ======================
          if (state is MovieLoading) {
            return const LoadingWidget();
          }

          // ======================
          // Error
          // ======================
          if (state is MovieError) {
            return ErrorMessageWidget(
              message: state.message,
            );
          }

          // ======================
          // Success
          // ======================
          if (state is MovieLoaded) {
            final movies = state.movies;

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: movies[index],
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}