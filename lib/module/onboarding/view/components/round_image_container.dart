import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class RoundImageContainer extends StatelessWidget {
  final String imagePath;
  final double size;
  final bool isAsset;
  final double imageScale;
  final VoidCallback? onTap;

  const RoundImageContainer({
    super.key,
    required this.imagePath,
    this.size = 60.0,
    this.isAsset = true,
    this.imageScale = 0.6,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double imageSize = size * imageScale;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.of(context).white,
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            height: imageSize,
            width: imageSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class AndroidGoogleContainer extends StatelessWidget {
  final String imagePath;
  final double size;
  final bool isAsset;
  final double imageScale;
  final VoidCallback? onTap;

  const AndroidGoogleContainer({
    super.key,
    required this.imagePath,
    this.size = 60.0,
    this.isAsset = true,
    this.imageScale = 0.6,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double imageSize = 60 * imageScale;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.of(context).white,
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            height: imageSize,
            width: imageSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
