import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/common/ui/custom_button.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/module/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:yummy_bites/theme/app_colors.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.of(context).primaryBlack,
          body: Padding(
            padding: xlPadding,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: model.controller,
                    itemCount: model.pages.length,
                    onPageChanged: model.setIndex,
                    itemBuilder: (context, index) => model.pages[index],
                  ),
                ),
                Padding(
                  padding: xlPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(model.pages.length, (index) {
                          bool isActive = index == model.currentIndex;
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            height: 10,
                            width: isActive ? 10 : 10,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.of(context).primaryYellow
                                  : AppColors.of(context).lightBlack,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                xxlHSpan,
                CustomButton(
                  buttonLabel: "Explore Recipes",
                  onPressed: model.onExploreRecipesPressed,
                ),
                xxlHSpan,
              ],
            ),
          ),
        );
      },
    );
  }
}

@RoutePage()
class OnboardPage extends StatelessWidget {
  final String title;
  final String imagePath;

  const OnboardPage({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: xlPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: 600,
              width: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Center(
                child: SvgPicture.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
          ),
          xxlHSpan,
          Text(
            "Smart Recipes, Just\nFor You!",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
