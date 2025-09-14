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

  // clearStackAndShowLoginView() {
  //   return _router.pushAndPopUntil(
  //     const routes.LoginView(),
  //     predicate: (r) => false,
  //   );
  // }
}

extension RouterHelperX on RouterHelper {
  // Future<dynamic> navigateToLoginView() async {
  //   return navigate(routes.LoginView());
  // }

  Future<dynamic> navigateToDashboardView() async {
    return navigate(routes.DashboardView());
  }

  Future<dynamic> navigateToOnboardingView() async {
    return navigate(routes.OnboardingView());
  }

  // Future<dynamic> navigateToTrialView() async {
  //   return navigate(routes.GetStartedView());
  // }

  // Future<dynamic> navigateToForgotPasswordview() async {
  //   return navigate(routes.ForgotPasswordView());
  // }

  // Future<dynamic> navigateToResetPasswordview() async {
  //   return navigate(routes.ResetPasswordView());
  // }

  // Future<dynamic> navigateToOtpVerificationview(String email) async {
  //   return navigate(routes.OtpVerificationView(email: email));
  // }

  // Future<dynamic> navigateToLastCycleView() async {
  //   return navigate(routes.LastCycleView());
  // }

  // Future<dynamic> navigateToDashboardView() async {
  //   return navigate(routes.DashboardView());
  // }

  // Future<dynamic> navigateToNotificationsView() async {
  //   return navigate(routes.NotificationsView());
  // }

  // Future<dynamic> navigateToProfileView() async {
  //   return navigate(routes.ProfileDrawer());
  // }

  // Future<dynamic> navigateToSecurityView() async {
  //   return navigate(routes.SecurityView());
  // }

  // Future<dynamic> navigateToInitialQnaView() async {
  //   return navigate(routes.InitialQnaView());
  // }

  // Future<dynamic> navigateToFeedbackView() async {
  //   return navigate(routes.FeedbackView());
  // }

  // Future<dynamic> navigateToThankyouView() async {
  //   return navigate(routes.ThankyouView());
  // }

  // Future<dynamic> navigateToChooseLanguageView() async {
  //   return navigate(routes.ChooseLanguageView());
  // }
}
