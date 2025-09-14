import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/common/ui/custom_button.dart';
import 'package:yummy_bites/common/ui/custom_divider.dart';
import 'package:yummy_bites/common/ui/custom_scaffold.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/localization/assets_localized_strings.dart';
import 'package:yummy_bites/localization/localized_strings.dart';
import 'package:yummy_bites/module/onboarding/view/components/round_image_container.dart';
import 'package:yummy_bites/module/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:yummy_bites/theme/app_colors.dart';

@RoutePage()
class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) {
        return CustomScaffold(
          title: LocalizedStrings.welcome,
          subtitle: LocalizedStrings.thankyouForJoining,
          body: Padding(
            padding: lPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                xxlHSpan,
                Flexible(
                  child: Container(
                    height: 230,
                    width: 230,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AssetStrings.welcome,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                xlHSpan,
                Padding(
                  padding: const EdgeInsets.all(4).copyWith(bottom: 0),
                  child: Text(
                    LocalizedStrings.periodTrackingAppForMen,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.of(context).white,
                    ),
                  ),
                ),
                xlHSpan,

                CustomButton(
                  borderRadius: 30,

                  buttonLabel: LocalizedStrings.createAnAccount,
                ),
                lHSpan,
                CustomOutlinedButton(
                  borderRadius: 30,

                  buttonLabel: LocalizedStrings.alreadyHaveAnAccount,
                ),
                xlHSpan,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomDivider(text: LocalizedStrings.or),
                ),
                xlHSpan,
                if (Platform.isIOS)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundImageContainer(imagePath: AssetStrings.googleIcon),

                      RoundImageContainer(imagePath: AssetStrings.appleIcon),
                    ],
                  ),
                if (Platform.isAndroid)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AndroidGoogleContainer(
                        imagePath: AssetStrings.googleIcon,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class IconTextContainer extends StatelessWidget {
  final String iconPath;
  final String text;

  const IconTextContainer({
    super.key,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.of(context).white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(iconPath, fit: BoxFit.contain),

            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColors.of(context).white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
