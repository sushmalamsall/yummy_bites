import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class FavouriteButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const FavouriteButton({super.key, this.initialValue = false, this.onChanged});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  late bool isFavourite;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      isFavourite = !isFavourite;
    });
    widget.onChanged?.call(isFavourite);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isFavourite
              ? Colors.redAccent.withOpacity(0.4)
              : AppColors.of(context).mediumBlack,
        ),
        alignment: Alignment.center,
        child: Icon(
          isFavourite ? EneftyIcons.heart_bold : EneftyIcons.heart_outline,
          size: 20,
          color: isFavourite ? Colors.redAccent : Colors.grey,
        ),
      ),
    );
  }
}
