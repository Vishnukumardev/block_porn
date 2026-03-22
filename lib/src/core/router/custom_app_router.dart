import 'package:auto_route/auto_route.dart';
import 'custom_app_router.gr.dart';

@AutoRouterConfig()
class CustomAppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // 1. Auth Route is a standalone root route
    AutoRoute(path: '/auth', page: AuthRoute.page),

    // 2. Main Route is a standalone root route, NOT a child of AuthRoute
    AutoRoute(
      path: '/main',
      page: MainRoute.page,
      initial: true,
      children: [
        // When entering '/main', automatically redirect to the home sub-page
        RedirectRoute(path: '', redirectTo: 'home'),

        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'leaderboard', page: LeaderboardRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
        AutoRoute(path: 'analytics', page: AnalyticsRoute.page),
        AutoRoute(path: 'subscription', page: SubscriptionRoute.page),
      ],
    ),
  ];
}
