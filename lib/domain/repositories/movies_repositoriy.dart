import 'package:cinema_tracker/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    try {
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
