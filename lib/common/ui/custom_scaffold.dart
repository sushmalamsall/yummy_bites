import 'package:flutter/material.dart';
import 'package:yummy_bites/common/ui/custom_two_column_text.dart';
import 'package:yummy_bites/common/ui/custom_ui_helper.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? showBackButton;
  final Widget body;
  final bool floating;
  final VoidCallback? onFabPressed;
  final Widget? leading;
  final bool bottomPadding;
  const CustomScaffold({
    super.key,
    this.title,
    this.subtitle,
    this.showBackButton = false,
    required this.body,
    this.floating = false,
    this.onFabPressed,
    this.bottomPadding = false,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        leading: leading,
        actionsIconTheme: IconThemeData(color: AppColors.of(context).white),
        iconTheme: IconThemeData(color: AppColors.of(context).white),
        title: Padding(
          padding: showBackButton == false
              ? const EdgeInsets.only(left: 14)
              : EdgeInsets.zero,
          child: CustomTwoColumnText(
            title: title ?? "",
            subtitle: subtitle ?? "",
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: showBackButton ?? false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF111111), // dark color
              Color(0xFF1A1A1A), // slightly lighter
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(padding: xlPadding.copyWith(bottom: 0), child: body),
      ),
      floatingActionButton: floating
          ? GestureDetector(
              onTap: onFabPressed,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2FD3E8),
                      Color(0xFF5DADF6),
                      Color(0xFF98A1FD),
                    ],
                    stops: [0.0, 0.50, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            )
          : null,
    );
  }
}
