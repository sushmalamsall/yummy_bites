import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/common/ui/custom_keyboard_hide.dart';
import 'package:yummy_bites/common/ui/custom_scaffold.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/common/ui/custom_underlined_button.dart';
import 'package:yummy_bites/module/home/viewmodel/home_view_model.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return CustomKeyboardHide(
          child: CustomScaffold(
            title: "Hi, Ukme",
            subtitle: "Ready to cook for dinner?",
            body: Column(
              children: [
                SizedBox(height: 150),
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppColors.of(context).lightBlack,
                  ),
                ),
                xxlHSpan,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meal Category",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    CustomUnderlinedButton(
                      onPressed: () {},
                      buttonLabel: "See All",
                    ),
                  ],
                ),
                lHSpan,
                ListView.separated(
                  itemCount: model.mealCategories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = model.mealCategories[index];
                    return Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.of(context).mediumBlack,
                            AppColors.of(context).secondaryBlack,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: sPadding,
                        child: Row(
                          children: [
                            Text(
                              "🍕",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            sWSpan,
                            Text(
                              category,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
