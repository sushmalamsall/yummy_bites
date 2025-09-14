import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? path;
  final double? height, width;
  final BoxFit? fit;
  final double? borderRadius;
  final Function()? onTap;
  final Color? backgroundColor;
  final bool? fullScreen;
  final Widget Function(BuildContext)? errorBuilder;
  final Widget Function(BuildContext)? loadingBuilder;
  final bool cache;
  final Key? imageKey;

  const CustomNetworkImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
    this.onTap,
    this.backgroundColor,
    this.fullScreen = true,
    this.errorBuilder,
    this.loadingBuilder,
    this.cache = true,
    this.imageKey,
  });

  factory CustomNetworkImage.twoLetterNameErrorBuilder(
    String? path,
    String? name, {
    double? height,
    double? width,
    BoxFit? fit,
    double? borderRadius,
    Function()? onTap,
    Color? backgroundColor,
    bool? fullScreen,
  }) {
    String l1 = "";
    String l2 = "";
    if (name != null && name.trim().isNotEmpty) {
      final splits = name.trim().split(" ");
      l1 = splits.first[0];
      if (splits.length > 1) {
        l2 = splits.last[0];
      }
    }

    return CustomNetworkImage(
      path,
      height: height,
      width: width,
      fit: fit,
      borderRadius: borderRadius,
      onTap: onTap,
      backgroundColor: backgroundColor,
      fullScreen: fullScreen,
      errorBuilder: (context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(max(width ?? 0, height ?? 0)),
          color: backgroundColor ?? AppColors.of(context).white,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (l1.isNotEmpty)
                Text(
                  l1,
                  style: TextStyle(
                    fontSize: (height != null) ? (0.35 * height) : 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              if (l2.isNotEmpty)
                SizedBox(width: (height != null) ? (0.01 * height) : 0.75),
              if (l2.isNotEmpty)
                Text(
                  l2,
                  style: TextStyle(
                    fontSize: (height != null) ? (0.4 * height) : 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: ((fullScreen ?? false))
          ? () {
              if ((fullScreen ?? false) && (path != null)) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CustomNetworkImageFullView(path: path!),
                  ),
                );
              }
            }
          : null,
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
    );
  }

  Widget errorWidget(BuildContext context) {
    return errorBuilder?.call(context) ??
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              borderRadius ?? max(width ?? 0, height ?? 0),
            ),
            color: AppColors.of(context).white,
          ),
        );
  }
}

class CustomAssetImage extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit? fit;
  final double? borderRadius;
  final Function()? onTap;
  final String? package;
  final Widget Function(dynamic, dynamic, dynamic)? errorBuilder;

  const CustomAssetImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
    this.onTap,
    this.package,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: _body(context));
  }

  Widget _body(BuildContext context) {
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: body(),
      );
    }

    return body();
  }

  Widget body() {
    return Image.asset(
      path,
      height: height,
      width: width,
      package: package,
      fit: fit ?? BoxFit.cover,
      errorBuilder:
          errorBuilder ??
          (BuildContext context, __, ___) => errorWidget(context),
    );
  }

  Widget errorWidget(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.of(context).white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
    );
  }
}

class CustomBase64Image extends StatelessWidget {
  final String? base64;
  final double? height, width;
  final BoxFit? fit;
  final double? borderRadius;
  final Function()? onTap;
  final bool? gaplessPlayback;

  const CustomBase64Image(
    this.base64, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
    this.onTap,
    this.gaplessPlayback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: body(context),
      );
    }

    return body(context);
  }

  Widget body(BuildContext context) {
    if (base64 != null && base64!.trim().isNotEmpty) {
      return Image.memory(
        base64Decode(base64!),
        height: height,
        width: width,
        gaplessPlayback: gaplessPlayback ?? true,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (BuildContext context, __, ___) => errorWidget(context),
      );
    }

    return errorWidget(context);
  }

  Widget errorWidget(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.of(context).white,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
    );
  }
}

class CustomNetworkImageFullView extends StatelessWidget {
  final String path;

  const CustomNetworkImageFullView({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    final height = MediaQuery.of(context).size.height * 0.5;

    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: InteractiveViewer(
        minScale: 0.1,
        maxScale: 100,
        child: Center(
          child: CustomNetworkImage(
            '$path?fullscreen=true',
            fit: BoxFit.contain,
            fullScreen: false,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
