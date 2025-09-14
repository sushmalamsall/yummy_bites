import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yummy_bites/common/ui/custom_keyboard_hide.dart';
import 'package:yummy_bites/common/ui/custom_scaffold.dart';
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
                SizedBox(height: 160),
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppColors.of(context).lightBlack,
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
