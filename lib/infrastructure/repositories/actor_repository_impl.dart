import 'package:cinema_tracker/domain/entities/actor.dart';
import 'package:cinema_tracker/domain/repositories/actors_repository.dart';

import '../../domain/datasources/actors_datasource.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
