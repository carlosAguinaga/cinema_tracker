import 'package:cinema_tracker/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final movieSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowMoviesPlayer = ref.watch(nowPlayeingMoviesProvider);

  if (nowMoviesPlayer.isEmpty) return [];

  return nowMoviesPlayer.sublist(0, 6);
});
