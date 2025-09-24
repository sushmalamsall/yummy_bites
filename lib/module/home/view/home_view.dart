import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/common/ui/custom_keyboard_hide.dart';
import 'package:yummy_bites/common/ui/custom_scaffold.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/common/ui/custom_underlined_button.dart';
import 'package:yummy_bites/common/utils/custom_rating.dart';
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
            subtitle: "Ready to make Breakfast?",
            body: Column(
              children: [
                SizedBox(height: 130),
                Padding(
                  padding: sPadding,
                  child: Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.of(context).mediumBlack,
                          AppColors.of(context).secondaryBlack,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 8,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
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
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.mealCategories.length,
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final category = model.mealCategories[index];
                      final isSelected = model.selectedCategoryIndex == index;

                      return InkWell(
                        onTap: () => model.selectCategory(index),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 45,
                          width: 140,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.of(context).yellow
                                : null,
                            gradient: isSelected
                                ? null
                                : LinearGradient(
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
                                  category["emoji"]!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                                sWSpan,
                                Text(
                                  category["name"]!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: GridView.builder(
                    padding: sPadding.copyWith(top: 70, bottom: 0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 80,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: model.selectedMeals.length,
                    itemBuilder: (context, index) {
                      final meal = model.selectedMeals[index];

                      return GestureDetector(
                        onTap: model.onFoodPressed,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.of(context).secondaryBlack,
                                    AppColors.of(context).secondaryBlack,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: Offset(2, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: xsPadding,
                                      child: Text(
                                        meal["name"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    CustomRating(
                                      rating: meal["rating"],
                                      size: 18,
                                      filledColor: AppColors.of(
                                        context,
                                      ).primaryYellow,
                                      unfilledColor: AppColors.of(
                                        context,
                                      ).lightBlack,
                                    ),
                                    mHSpan,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              meal["time"].toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Min",
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        mWSpan,

                                        SizedBox(
                                          height: 20,
                                          child: VerticalDivider(
                                            color: Colors.white,
                                            thickness: 0.8,
                                          ),
                                        ),
                                        mWSpan,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              meal["level"],
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Lvl",
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    lHSpan,
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              top: -50,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: FittedBox(
                                      fit: BoxFit
                                          .cover, // makes the bowl scale to fill
                                      child: Image.asset(meal["image"]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
