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
    MaterialRoute(path: "/food-view", page: FoodView.page),
  ];
}
