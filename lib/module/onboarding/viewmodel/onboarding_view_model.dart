import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/localization/assets_localized_strings.dart';
import 'package:yummy_bites/localization/localized_strings.dart';
import 'package:yummy_bites/module/onboarding/view/onboarding_view.dart';
import 'package:yummy_bites/routes/navigation_helper.dart';

class OnboardingViewModel extends IndexTrackingViewModel {
  final List<Widget> pages = [
    OnboardPage(
      title: LocalizedStrings.onBoardingTitle1,
      imagePath: AssetStrings.onboarding1,
    ),
    OnboardPage(
      title: LocalizedStrings.onBoardingTitle2,
      imagePath: AssetStrings.onboarding2,
    ),
    OnboardPage(
      title: LocalizedStrings.onBoardingTitle3,
      imagePath: AssetStrings.onboarding3,
    ),
  ];
  final PageController controller = PageController();

  void skip() {}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> handleNext(BuildContext context) async {
    if (currentIndex < 2) {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {}
  }

  onExploreRecipesPressed() {
    RouterHelper().navigateToDashboardView();
  }
}
