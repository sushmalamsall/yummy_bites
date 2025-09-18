import 'package:flutter/material.dart';

class CustomSingleStarRating extends StatelessWidget {
  final double rating; // value between 0–5
  final double size;
  final Color filledColor;
  final Color unfilledColor;

  const CustomSingleStarRating({
    super.key,
    required this.rating,
    this.size = 40,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    // Normalize rating → fraction of star (0–1)
    final fraction = (rating / 5).clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Icon(Icons.star, size: size, color: unfilledColor),
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  stops: [fraction, fraction],
                  colors: [filledColor, Colors.transparent],
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                );
              },
              blendMode: BlendMode.srcATop,
              child: Icon(Icons.star, size: size, color: filledColor),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            fontSize: size * 0.4,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
