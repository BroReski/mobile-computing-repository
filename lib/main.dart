import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/services/connectivity_service.dart';
import 'data/datasource/movie_api_service.dart';
import 'data/datasource/movie_local_service.dart';
import 'data/repository/movie_repository.dart';
import 'presentation/bloc/movie_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localService = MovieLocalService();
  await localService.init();

  final repository = MovieRepository(
    apiService: MovieApiService(),
    localService: localService,
    connectivityService: ConnectivityService(),
  );

  runApp(
    BlocProvider(
      create: (_) => MovieBloc(repository),
      child: const MovieApp(),
    ),
  );
}