import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  final double indent;
  final double thickness;
  final Color color;

  const CustomDivider({
    super.key,
    required this.text,
    this.indent = 2.0,
    this.thickness = 1.0,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: color,
            thickness: thickness,
            indent: indent,
            endIndent: 8,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Divider(
            color: color,
            thickness: thickness,
            indent: 8,
            endIndent: indent,
          ),
        ),
      ],
    );
  }
}
