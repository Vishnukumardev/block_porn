import 'package:auto_route/auto_route.dart';
import 'package:block_porn/main.dart';
import 'package:flutter/material.dart';
import '../../../../core/router/custom_app_router.gr.dart';
import '../../../../shared/view/widgets/app_bar.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsScaffold(
        key: navigatorKey,
        routes: [
          HomeRoute(),
          LeaderboardRoute(),
          AnalyticsRoute(),
          // SubscriptionRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (context, router) {
          return BottomNavigationBar(
            currentIndex: router.activeIndex,
            onTap: router.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: 'Leaderboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics),
                label: "Analyze",
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.subscriptions),
              //   label: "Subscribe",
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "Profile",
              ),
            ],
          );
        },
      ),
    );
  }
}
