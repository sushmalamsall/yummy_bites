import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yummy_bites/common/services/setup_custom_snackbars.dart';

@injectable
class ToastService {
  final SnackbarService snackBarService;

  ToastService(this.snackBarService);

  s(
    String message, {
    Duration duration = const Duration(milliseconds: 1500),
    Function? onTap,
    void Function()? onMainButtonTapped,
    String? mainButtonTitle,
    bool override = false,
    bool doNotShowIfSnackBarIsOpen = true,
  }) {
    if (doNotShowIfSnackBarIsOpen && snackBarService.isSnackbarOpen) {
      return;
    }

    if (override && snackBarService.isSnackbarOpen) {
      snackBarService.closeSnackbar();
    }

    snackBarService.showCustomSnackBar(
      duration: duration,
      variant: SnackBarType.success,
      message: message,
      mainButtonTitle: mainButtonTitle,
      onTap: onTap,
      onMainButtonTapped: onMainButtonTapped,
    );
  }

  e(
    String error, {
    Duration duration = const Duration(milliseconds: 2000),
    Function? onTap,
    void Function()? onMainButtonTapped,
    String? mainButtonTitle,
    bool override = false,
    bool doNotShowIfSnackBarIsOpen = true,
  }) {
    if (doNotShowIfSnackBarIsOpen && snackBarService.isSnackbarOpen) {
      return;
    }

    if (override && snackBarService.isSnackbarOpen) {
      snackBarService.closeSnackbar();
    }

    snackBarService.showCustomSnackBar(
      duration: duration,
      variant: SnackBarType.error,
      message: error,
      mainButtonTitle: mainButtonTitle,
      onTap: onTap,
      onMainButtonTapped: onMainButtonTapped,
    );
  }

  w(
    String warning, {
    Duration duration = const Duration(milliseconds: 1500),
    Function? onTap,
    void Function()? onMainButtonTapped,
    String? mainButtonTitle,
    bool override = false,
    bool doNotShowIfSnackBarIsOpen = true,
  }) {
    if (doNotShowIfSnackBarIsOpen && snackBarService.isSnackbarOpen) {
      return;
    }

    if (override && snackBarService.isSnackbarOpen) {
      snackBarService.closeSnackbar();
    }

    snackBarService.showCustomSnackBar(
      duration: duration,
      variant: SnackBarType.warning,
      message: warning,
      mainButtonTitle: mainButtonTitle,
      onTap: onTap,
      onMainButtonTapped: onMainButtonTapped,
    );
  }

  i(
    String info, {
    Duration duration = const Duration(milliseconds: 1500),
    Function? onTap,
    void Function()? onMainButtonTapped,
    String? mainButtonTitle,
    bool override = false,
    bool doNotShowIfSnackBarIsOpen = true,
  }) {
    if (doNotShowIfSnackBarIsOpen && snackBarService.isSnackbarOpen) {
      return;
    }

    if (override && snackBarService.isSnackbarOpen) {
      snackBarService.closeSnackbar();
    }

    snackBarService.showCustomSnackBar(
      duration: duration,
      variant: SnackBarType.info,
      message: info,
      mainButtonTitle: mainButtonTitle,
      onTap: onTap,
      onMainButtonTapped: onMainButtonTapped,
    );
  }

  show(
    String defaultMessage, {
    Duration duration = const Duration(milliseconds: 1500),
    Function? onTap,
    void Function()? onMainButtonTapped,
    String? mainButtonTitle,
    bool override = false,
    bool doNotShowIfSnackBarIsOpen = true,
  }) {
    if (doNotShowIfSnackBarIsOpen && snackBarService.isSnackbarOpen) {
      return;
    }

    if (override && snackBarService.isSnackbarOpen) {
      snackBarService.closeSnackbar();
    }

    snackBarService.showCustomSnackBar(
      duration: duration,
      variant: SnackBarType.general,
      message: defaultMessage,
      mainButtonTitle: mainButtonTitle,
      onTap: onTap,
      onMainButtonTapped: onMainButtonTapped,
    );
  }
}
