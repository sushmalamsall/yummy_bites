import 'package:flutter/material.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const CustomAppBar({super.key, this.showBackButton = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final backButton = Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.of(context).white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back,
          color: AppColors.of(context).primaryYellow,
          size: 20,
        ),
      ),
    );

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showBackButton ? backButton : null,
      centerTitle: true,
      actions: [if (showBackButton) const SizedBox(width: 48)],
    );
  }
}
