import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/common/ui/custom_keyboard_hide.dart';
import 'package:yummy_bites/common/ui/custom_search_bar.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/common/utils/custom_rating.dart';
import 'package:yummy_bites/module/search/components/search_topics.dart';
import 'package:yummy_bites/module/search/viewmodel/search_view_model.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) {
        final meals = model.allMeals; // meals for selected category
        return CustomKeyboardHide(
          child: Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  lHSpan,
                  Padding(
                    padding: lPadding.copyWith(bottom: 0),
                    child: CustomSearchBar(
                      hintText: "Search meals...",
                      onChanged: (value) {},
                    ),
                  ),
                  lHSpan,
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        SearchTopics(
                          text: "Trending",
                          icon: CupertinoIcons.flame_fill,
                          iconColor: AppColors.of(context).primaryYellow,
                        ),

                        SearchTopics(
                          text: "Best Rated",
                          icon: Icons.star,
                          iconColor: AppColors.of(context).primaryYellow,
                        ),
                        SearchTopics(
                          text: "Italian",
                          icon: EneftyIcons.heart_bold,
                        ),
                        SearchTopics(text: "Korean"),
                        SearchTopics(
                          text: "Favourites",
                          icon: EneftyIcons.heart_bold,
                          iconColor: Colors.redAccent,
                        ),
                        SearchTopics(text: "Dessert"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      itemCount: meals.length,
                      itemBuilder: (context, index) {
                        final meal = meals[index];
                        return Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.2,
                              ),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(meal["image"]),
                                ),
                              ),
                            ),
                            title: Text(
                              meal["name"],
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                CustomRating(
                                  rating: meal["rating"],
                                  size: 12,
                                  filledColor: AppColors.of(
                                    context,
                                  ).primaryYellow,
                                  unfilledColor: AppColors.of(
                                    context,
                                  ).lightBlack,
                                ),
                                sWSpan,
                                Text(
                                  "(${meal["rating"].toString()})",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Wrap(
                              spacing: 2,
                              children: [
                                if (meal["trending"] == true)
                                  Icon(
                                    CupertinoIcons.flame_fill,
                                    size: 15,
                                    color: AppColors.of(context).primaryYellow,
                                  ),
                                if (meal["isfavourite"] == true)
                                  Icon(
                                    EneftyIcons.heart_bold,
                                    size: 15,
                                    color: Colors.redAccent,
                                  ),
                              ],
                            ),

                            onTap: () {
                              // handle tap if needed
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
