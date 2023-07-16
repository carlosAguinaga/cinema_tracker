import 'package:cinema_tracker/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    name: HomeScreem.name,
    builder: (context, state) => const HomeScreem(),
  )
]);
