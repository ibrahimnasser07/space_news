import 'package:go_router/go_router.dart';
import 'package:space_news/UI/screens/home.dart';
import 'package:space_news/utils/route_constants.dart';

import '../UI/screens/news.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (__, _) => const Home(),
      ),
      GoRoute(
        path: news,
        builder: (context, state) => const News(),
      ),
    ],
  );
}