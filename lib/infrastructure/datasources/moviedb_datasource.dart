import 'package:cinema_tracker/config/constans/environment.dart';
import 'package:cinema_tracker/domain/datasources/movies_datasource.dart';
import 'package:cinema_tracker/domain/entities/movie.dart';
import 'package:cinema_tracker/infrastructure/mappers/movie_mapper.dart';
import 'package:cinema_tracker/infrastructure/models/moviedb/movie_moviedb.dart';
import 'package:cinema_tracker/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviesDbDatasource extends MoviesDatasource {
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
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((movieDB) => movieDB.posterPath != 'no-poster')
        .map((movieDB) => MovieMapper.movieDBToEntity(movieDB))
        .toList();

    return movies;
  }
}
