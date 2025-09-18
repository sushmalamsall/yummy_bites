import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class SearchTopics extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? iconColor;

  const SearchTopics({
    super.key,
    required this.text,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.of(context).mediumBlack,
            AppColors.of(context).secondaryBlack,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: Colors.grey, width: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
          ),
          if (icon != null) ...[
            sWSpan, // spacing between text and icon
            Icon(icon, size: 12, color: iconColor),
          ],
        ],
      ),
    );
  }
}
