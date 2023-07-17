import 'package:cinema_tracker/domain/datasources/movies_datasource.dart';
import 'package:cinema_tracker/domain/entities/movie.dart';
import 'package:cinema_tracker/domain/repositories/movies_repositoriy.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
