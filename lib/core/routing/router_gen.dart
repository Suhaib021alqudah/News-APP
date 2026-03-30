import 'package:api/core/routing/app_routes.dart';
import 'package:api/features/details/details_screen.dart';
import 'package:api/features/home/models/top_head_lines_model.dart';
import 'package:api/features/home/view/home_page.dart';
import 'package:api/features/result/screen/result_page.dart';
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
        builder: (context, state) {
          Article article = state.extra as Article;
          return DetailsScreen(article: article);
        },
      ),

      GoRoute(
        path: AppRoutes.resultPage,
        name: AppRoutes.resultPage,
        builder: (context, state) {
          final String query = (state.extra as String?) ?? 'Defualt Serach';
          return ResultPage(query: query);
        },
      ),

      GoRoute(
        path: AppRoutes.detailsScreen,
        name: AppRoutes.detailsScreen,
        builder: (context, state) {
          Article article = state.extra as Article;
          return DetailsScreen(article: article);
        },
      ),
    ],
  );
}
