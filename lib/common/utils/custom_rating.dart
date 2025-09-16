import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color filledColor;
  final Color unfilledColor;

  const CustomRating({
    super.key,
    required this.rating,
    this.size = 24,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double starFill = 0.0;

        if (rating >= index + 1) {
          starFill = 1.0;
        } else if (rating > index) {
          starFill = rating - index;
        }

        return Stack(
          children: [
            Icon(Icons.star, size: size, color: unfilledColor),
            ClipRect(
              clipper: _StarClipper(starFill),
              child: Icon(Icons.star, size: size, color: filledColor),
            ),
          ],
        );
      }),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillPercent;

  _StarClipper(this.fillPercent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * fillPercent, size.height);
  }

  @override
  bool shouldReclip(covariant _StarClipper oldClipper) {
    return oldClipper.fillPercent != fillPercent;
  }
}
