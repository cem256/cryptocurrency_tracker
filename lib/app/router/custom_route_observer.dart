// ignore_for_file: strict_raw_type

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log('[AutoRoute] New route pushed: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('[AutoRoute] Route popped: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    log('[AutoRoute] Route replaced: ${newRoute?.settings.name}, Old route: ${oldRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    log('[AutoRoute] Route removed: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log('[AutoRoute] Tab route initialized: ${route.name}, Previous tab route: ${previousRoute?.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log('[AutoRoute] Tab route changed: ${route.name}, Previous tab route: ${previousRoute.name}');
  }
}
