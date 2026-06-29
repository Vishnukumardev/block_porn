import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomRouteObserver extends AutoRouteObserver{
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('New route pushed: ${route.settings.name}');
  }
  // Only overrides if you are monitoring tab-based navigation
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugPrint('Tab initialized: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugPrint('Tab changed to: ${route.name}');
  }
}