// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:yummy_bites/module/dashboard/view/dashboard_view.dart' as _i1;
import 'package:yummy_bites/module/food/view/food_view.dart' as _i2;
import 'package:yummy_bites/module/onboarding/view/get_started_view.dart'
    as _i3;
import 'package:yummy_bites/module/onboarding/view/onboarding_view.dart' as _i4;
import 'package:yummy_bites/module/splash/view/splash_view.dart' as _i5;

/// generated route for
/// [_i1.DashboardView]
class DashboardView extends _i6.PageRouteInfo<void> {
  const DashboardView({List<_i6.PageRouteInfo>? children})
    : super(DashboardView.name, initialChildren: children);

  static const String name = 'DashboardView';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardView();
    },
  );
}

/// generated route for
/// [_i2.FoodView]
class FoodView extends _i6.PageRouteInfo<void> {
  const FoodView({List<_i6.PageRouteInfo>? children})
    : super(FoodView.name, initialChildren: children);

  static const String name = 'FoodView';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.FoodView();
    },
  );
}

/// generated route for
/// [_i3.GetStartedView]
class GetStartedView extends _i6.PageRouteInfo<void> {
  const GetStartedView({List<_i6.PageRouteInfo>? children})
    : super(GetStartedView.name, initialChildren: children);

  static const String name = 'GetStartedView';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.GetStartedView();
    },
  );
}

/// generated route for
/// [_i4.OnboardPage]
class OnboardRoute extends _i6.PageRouteInfo<OnboardRouteArgs> {
  OnboardRoute({
    _i7.Key? key,
    required String title,
    required String imagePath,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         OnboardRoute.name,
         args: OnboardRouteArgs(key: key, title: title, imagePath: imagePath),
         initialChildren: children,
       );

  static const String name = 'OnboardRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardRouteArgs>();
      return _i4.OnboardPage(
        key: args.key,
        title: args.title,
        imagePath: args.imagePath,
      );
    },
  );
}

class OnboardRouteArgs {
  const OnboardRouteArgs({
    this.key,
    required this.title,
    required this.imagePath,
  });

  final _i7.Key? key;

  final String title;

  final String imagePath;

  @override
  String toString() {
    return 'OnboardRouteArgs{key: $key, title: $title, imagePath: $imagePath}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        imagePath == other.imagePath;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ imagePath.hashCode;
}

/// generated route for
/// [_i4.OnboardingView]
class OnboardingView extends _i6.PageRouteInfo<void> {
  const OnboardingView({List<_i6.PageRouteInfo>? children})
    : super(OnboardingView.name, initialChildren: children);

  static const String name = 'OnboardingView';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingView();
    },
  );
}

/// generated route for
/// [_i5.SplashView]
class SplashView extends _i6.PageRouteInfo<void> {
  const SplashView({List<_i6.PageRouteInfo>? children})
    : super(SplashView.name, initialChildren: children);

  static const String name = 'SplashView';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashView();
    },
  );
}
