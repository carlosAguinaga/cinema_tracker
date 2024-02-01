import 'package:cinema_tracker/presentation/providers/providers.dart';
import 'package:cinema_tracker/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    await ref.read(popularMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    // if (movies.isEmpty) {
    //   isLastPage = true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(popularMoviesProvider);

    if (popularMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
            Text('Ohhh no!!',
                style: TextStyle(fontSize: 30, color: colors.primary)),
            const Text("You don't have favorite movies",
                style: TextStyle(fontSize: 20, color: Colors.black45)),
            const SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: const Text('Start searching'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        movies: popularMovies,
        loadNextPage: loadNextPage,
      ),
    );
  }
}
