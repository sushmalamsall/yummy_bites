import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yummy_bites/core/dependency_injection/injection.dart';

enum SnackBarType { success, error, warning, info, general }

void setupCustomSnackBars() {
  final service = injection<SnackbarService>();

  service.registerSnackbarConfig(
    SnackbarConfig(
      backgroundColor: Colors.black,
      textColor: Colors.white,
      messageColor: Colors.white,
      titleColor: Colors.white,
      mainButtonTextColor: Colors.black,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.warning,
    config: SnackbarConfig(
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.info,
    config: SnackbarConfig(
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.general,
    config: SnackbarConfig(
      backgroundColor: const Color(0xFF444444),
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );
}
