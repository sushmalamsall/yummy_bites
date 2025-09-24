import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../core/dependency_injection/injection.dart';
import 'app_routes.dart';
import 'app_routes.gr.dart' as routes;

class RouterHelper {
  final bool fromAutoTab;
  final BuildContext? context;

  RouterHelper() : fromAutoTab = false, context = null;

  RouterHelper.fromAutoTab(this.context) : fromAutoTab = true;

  StackRouter get _router => injection<AppRouter>();

  navigate(PageRouteInfo route) {
    if (fromAutoTab) {
      return AutoTabsRouter.of(context!).navigate(route);
    }

    return _router.push(route);
  }

  back([dynamic result]) {
    if (fromAutoTab) {
      return AutoTabsRouter.of(context!).maybePopTop(result);
    }

    return _router.maybePopTop(result);
  }

  navigateToView(
    Widget view, {
    RouteTransitionsBuilder? transitionBuilder,
    bool fullscreenDialog = false,
    Duration transitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
  }) {
    if (fromAutoTab) {}

    return _router.pushWidget(
      view,
      transitionBuilder: transitionBuilder,
      fullscreenDialog: fullscreenDialog,
      transitionDuration: transitionDuration,
      opaque: opaque,
    );
  }

  clearStackAndShowSplashView() {
    return _router.pushAndPopUntil(
      const routes.SplashView(),
      predicate: (r) => false,
    );
  }

  clearStackAndShowOnboardingView() {
    return _router.pushAndPopUntil(
      const routes.OnboardingView(),
      predicate: (r) => false,
    );
  }
}

extension RouterHelperX on RouterHelper {
  Future<dynamic> navigateToDashboardView() async {
    return navigate(routes.DashboardView());
  }

  Future<dynamic> navigateToOnboardingView() async {
    return navigate(routes.OnboardingView());
  }

  Future<dynamic> navigateToFoodView() async {
    return navigate(routes.FoodView());
  }
}
