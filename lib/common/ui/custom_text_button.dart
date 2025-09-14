import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        child: Center(child: child),
      ),
    );
  }
}

class CustomTextActionButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonLabel;

  const CustomTextActionButton({
    super.key,
    this.onPressed,
    required this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        child: Text(
          buttonLabel,
          textAlign: TextAlign.center,

          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: onPressed == null
                ? AppColors.of(context).secondaryBackground
                : AppColors.of(context).primaryYellow,
          ),
        ),
      ),
    );
  }
}
