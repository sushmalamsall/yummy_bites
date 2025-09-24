import 'package:auto_route/auto_route.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/common/ui/custom_keyboard_hide.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/module/favourites/view/favourite_widget.dart';
import 'package:yummy_bites/module/food/viewmodel/food_view_model.dart';
import 'package:yummy_bites/theme/app_colors.dart';

@RoutePage()
class FoodView extends StatelessWidget {
  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FoodViewModel(),
      builder: (context, model, child) {
        return CustomKeyboardHide(
          child: Scaffold(
            backgroundColor: AppColors.of(context).primaryBlack,
            body: Stack(
              children: [
                Padding(
                  padding: xlPadding.copyWith(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.of(context).mediumBlack,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),

                      FavouriteButton(
                        initialValue: false,
                        onChanged: (isFav) {
                          debugPrint("Favourite state: $isFav");
                        },
                      ),
                    ],
                  ),
                ),

                DraggableScrollableSheet(
                  initialChildSize: 0.70,
                  minChildSize: 0.70,
                  maxChildSize: 1.0,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.of(context).secondaryBlack,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),

                          // your sheet content
                          ListTile(
                            title: const Text("Pizza"),
                            subtitle: const Text("Cheesy and delicious"),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text("Burger"),
                            subtitle: const Text("Juicy beef patty"),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text("Pasta"),
                            subtitle: const Text("Creamy Alfredo"),
                            onTap: () {},
                          ),
                        ],
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
