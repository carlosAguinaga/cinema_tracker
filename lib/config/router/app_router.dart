import 'package:cinema_tracker/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/home/0",
  routes: [
    GoRoute(
      path: "/home/:page",
      name: HomeScreem.name,
      builder: (context, state) {
        final int pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreem(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: "movie/:id",
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
