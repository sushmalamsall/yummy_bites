import 'package:auto_route/auto_route.dart';
import 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    MaterialRoute(path: "/splash", page: SplashView.page, initial: true),
    MaterialRoute(path: "/onboarding", page: OnboardingView.page),
    MaterialRoute(path: "/dashboard", page: DashboardView.page),
    // MaterialRoute(path: "/get-started", page: GetStartedView.page),
    // MaterialRoute(path: "/forgot-password", page: ForgotPasswordView.page),
    // MaterialRoute(path: "/reset-password", page: ResetPasswordView.page),
    // MaterialRoute(path: "/otp-verification", page: OtpVerificationView.page),
    // MaterialRoute(path: "/last-period-cycle", page: LastCycleView.page),
    // MaterialRoute(path: "/dashboard", page: DashboardView.page),
    // MaterialRoute(path: "/notifications", page: NotificationsView.page),
    // MaterialRoute(path: "/profile", page: ProfileDrawer.page),
    // MaterialRoute(path: "/security", page: SecurityView.page),
    // MaterialRoute(path: "/initial-qna", page: InitialQnaView.page),
    // MaterialRoute(path: "/feedback", page: FeedbackView.page),
    // MaterialRoute(path: "/thankyou", page: ThankyouView.page),
    // MaterialRoute(path: "/choose-language", page: ChooseLanguageView.page),
  ];
}
