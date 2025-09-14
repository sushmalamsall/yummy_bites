import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/common/ui/custom_loader.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final double borderRadius;
  final Color? color;
  final double? width;
  final bool busy;
  final String? buttonLabel;
  final Color disabledColor;

  const CustomButton({
    super.key,
    this.onPressed,
    this.borderRadius = 16,
    this.color,
    this.width = double.infinity,
    this.busy = false,
    required this.buttonLabel,
    this.disabledColor = const Color(0xFF222B4C),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: onPressed == null
              ? AppColors.of(context).secondaryBackground
              : AppColors.of(context).primaryYellow,

          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: busy
            ? Center(child: CustomLoader.minimal())
            : Center(
                child: Text(
                  buttonLabel ?? "",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: onPressed == null
                        ? AppColors.of(context).lightBlack
                        : (AppColors.of(context).primaryBlack),
                  ),
                ),
              ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Function()? onPressed;
  final double borderRadius;
  final Color? color;
  final bool busy;
  final Color disabledColor;
  final IconData icon;

  const CustomIconButton({
    super.key,
    this.onPressed,
    this.borderRadius = 30,
    this.color,
    this.busy = false,
    this.disabledColor = const Color(0xFF212121),
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: onPressed == null
              ? disabledColor
              : AppColors.of(context).primaryYellow,

          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: busy
            ? Center(child: CustomLoader.minimal())
            : Center(
                child: Icon(
                  icon,
                  color: onPressed == null
                      ? Colors.white30
                      : (AppColors.of(context).white),
                ),
              ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final double borderRadius;
  final Color? color;
  final bool busy;
  final String? buttonLabel;
  final Color disabledColor;
  final double? width;

  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    this.borderRadius = 30,
    this.color,
    this.busy = false,
    required this.buttonLabel,
    this.disabledColor = const Color(0xFF212121),
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: Border.all(
            width: 2,
            color: AppColors.of(context).primaryYellow,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: busy
            ? Center(child: CustomLoader.minimal())
            : Center(
                child: Text(
                  buttonLabel ?? "",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.of(context).primaryYellow,
                  ),
                ),
              ),
      ),
    );
  }
}
