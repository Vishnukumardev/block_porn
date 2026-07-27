import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    if (_isModal(route)) {
      debugPrint('Modal opened: ${route.settings.name ?? route.runtimeType}');
    } else {
      debugPrint('New route pushed: ${route.settings.name}');
    }
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugPrint('Tab initialized: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugPrint('Tab changed to: ${route.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (_isModal(route)) {
      debugPrint('Modal closed: ${route.settings.name ?? route.runtimeType}');
    } else {
      debugPrint('New route pushed: ${route.settings.name}');
    }
  }

  bool _isModal(Route<dynamic> route) {
    // PopupRoute covers dialogs, bottom sheets, menus, etc.
    return route is PopupRoute ||
        route.runtimeType.toString().contains('ModalBottomSheetRoute');
  }
}
