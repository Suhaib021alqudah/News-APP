import 'package:api/core/routing/app_routes.dart';
import 'package:api/features/home/view/home_page.dart';
import 'package:api/features/news_page.dart';
import 'package:api/features/result_page.dart';
import 'package:api/features/search_page.dart';
import 'package:go_router/go_router.dart';

class RouterGen {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homePage,

    routes: [
      GoRoute(
        path: AppRoutes.homePage,
        name: AppRoutes.homePage,
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
        path: AppRoutes.newsPage,
        name: AppRoutes.newsPage,
        builder: (context, state) => const NewsPage(),
      ),
      GoRoute(
        path: AppRoutes.searchPage,
        name: AppRoutes.searchPage,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: AppRoutes.resultPage,
        name: AppRoutes.resultPage,
        builder: (context, state) => const ResultPage(),
      ),
    ],
  );
}
