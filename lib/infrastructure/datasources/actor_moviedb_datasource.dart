import 'package:cinema_tracker/config/constans/environment.dart';
import 'package:cinema_tracker/domain/datasources/actors_datasource.dart';
import 'package:cinema_tracker/domain/entities/actor.dart';
import 'package:cinema_tracker/infrastructure/mappers/actor_mapper.dart';
import 'package:cinema_tracker/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'lenguage': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
