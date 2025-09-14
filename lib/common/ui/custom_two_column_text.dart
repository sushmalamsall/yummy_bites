import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';

class CustomTwoColumnText extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomTwoColumnText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 34,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),

        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
