import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class CustomUnderlinedButton extends StatelessWidget {
  final String? buttonLabel;
  final VoidCallback? onPressed;
  const CustomUnderlinedButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        buttonLabel!,
        style: GoogleFonts.poppins(
          color: AppColors.of(context).primaryYellow,
          fontSize: 14,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.of(context).primaryYellow,
        ),
      ),
    );
  }
}
