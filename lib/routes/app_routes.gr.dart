// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:collection/collection.dart' as _i7;
import 'package:flutter/material.dart' as _i6;
import 'package:yummy_bites/module/dashboard/view/dashboard_view.dart' as _i1;
import 'package:yummy_bites/module/onboarding/view/get_started_view.dart'
    as _i2;
import 'package:yummy_bites/module/onboarding/view/onboarding_view.dart' as _i3;
import 'package:yummy_bites/module/splash/view/splash_view.dart' as _i4;

/// generated route for
/// [_i1.DashboardView]
class DashboardView extends _i5.PageRouteInfo<void> {
  const DashboardView({List<_i5.PageRouteInfo>? children})
    : super(DashboardView.name, initialChildren: children);

  static const String name = 'DashboardView';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardView();
    },
  );
}

/// generated route for
/// [_i2.GetStartedView]
class GetStartedView extends _i5.PageRouteInfo<void> {
  const GetStartedView({List<_i5.PageRouteInfo>? children})
    : super(GetStartedView.name, initialChildren: children);

  static const String name = 'GetStartedView';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.GetStartedView();
    },
  );
}

/// generated route for
/// [_i3.OnboardPage]
class OnboardRoute extends _i5.PageRouteInfo<OnboardRouteArgs> {
  OnboardRoute({
    _i6.Key? key,
    required String title,
    required String imagePath,
    required List<Map<String, dynamic>> richTextSegments,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         OnboardRoute.name,
         args: OnboardRouteArgs(
           key: key,
           title: title,
           imagePath: imagePath,
           richTextSegments: richTextSegments,
         ),
         initialChildren: children,
       );

  static const String name = 'OnboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardRouteArgs>();
      return _i3.OnboardPage(
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
    required this.richTextSegments,
  });

  final _i6.Key? key;

  final String title;

  final String imagePath;

  final List<Map<String, dynamic>> richTextSegments;

  @override
  String toString() {
    return 'OnboardRouteArgs{key: $key, title: $title, imagePath: $imagePath, richTextSegments: $richTextSegments}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        imagePath == other.imagePath &&
        const _i7.ListEquality().equals(
          richTextSegments,
          other.richTextSegments,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      imagePath.hashCode ^
      const _i7.ListEquality().hash(richTextSegments);
}

/// generated route for
/// [_i3.OnboardingView]
class OnboardingView extends _i5.PageRouteInfo<void> {
  const OnboardingView({List<_i5.PageRouteInfo>? children})
    : super(OnboardingView.name, initialChildren: children);

  static const String name = 'OnboardingView';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnboardingView();
    },
  );
}

/// generated route for
/// [_i4.SplashView]
class SplashView extends _i5.PageRouteInfo<void> {
  const SplashView({List<_i5.PageRouteInfo>? children})
    : super(SplashView.name, initialChildren: children);

  static const String name = 'SplashView';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashView();
    },
  );
}
