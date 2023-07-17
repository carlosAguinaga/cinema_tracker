import 'package:cinema_tracker/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinema_tracker/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this repository is immutable
final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl(MoviesDbDatasource());
});
