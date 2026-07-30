import 'package:auto_route/auto_route.dart';
import 'custom_app_router.gr.dart';

@AutoRouterConfig()
class CustomAppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/auth', page: AuthRoute.page),
    AutoRoute(
      path: '/main',
      page: MainRoute.page,
      initial: true,
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'leaderboard', page: LeaderboardRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
        AutoRoute(path: 'analytics', page: AnalyticsRoute.page),
        AutoRoute(path: 'subscription', page: SubscriptionRoute.page),
      ],
    ),
    AutoRoute(path: '/dns', page: DnsProtectRoute.page),
  ];
}
