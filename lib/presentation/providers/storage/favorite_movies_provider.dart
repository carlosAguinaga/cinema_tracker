import 'package:cinema_tracker/domain/entities/movie.dart';
import 'package:cinema_tracker/domain/repositories/local_storage_repository.dart';
import 'package:cinema_tracker/presentation/providers/storage/local_storage_porvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifire, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifire(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifire extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifire({
    required this.localStorageRepository,
  }) : super({});

  Future<List<Movie>> loadNexPage() async {
    const limit = 15;
    final movies = await localStorageRepository.loadMovies(
        limit: limit, offset: page * limit);

    page++;

    final tempMovies = <int, Movie>{};
    for (final movie in movies) {
      tempMovies[movie.id] = movie;
    }

    state = {...state, ...tempMovies};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorite = state[movie.id] != null;
    if (isMovieInFavorite) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
