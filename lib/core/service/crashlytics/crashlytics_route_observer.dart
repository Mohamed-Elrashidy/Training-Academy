import 'package:flutter/widgets.dart';
import 'package:training_acedamy/core/service/crashlytics/crashlytics_service.dart';

class CrashlyticsRouteObserver extends NavigatorObserver {
  CrashlyticsRouteObserver({CrashlyticsService? crashlyticsService})
    : _crashlyticsService = crashlyticsService ?? CrashlyticsService.instance;

  final CrashlyticsService _crashlyticsService;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _syncRoute(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _syncRoute(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _syncRoute(previousRoute);
  }

  void _syncRoute(Route<dynamic>? route) {
    final routeName = route?.settings.name;
    if (routeName == null || routeName.isEmpty) {
      return;
    }

    _crashlyticsService.setScreenContext(
      route: routeName,
      feature: CrashlyticsService.deriveFeatureFromRoute(routeName),
      module: CrashlyticsService.deriveModuleFromRoute(routeName),
    );
  }
}
