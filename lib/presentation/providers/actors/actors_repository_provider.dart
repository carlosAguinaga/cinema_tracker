import 'package:cinema_tracker/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinema_tracker/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this repository is immutable
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
