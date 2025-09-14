import 'package:stacked_services/stacked_services.dart';
import 'package:yummy_bites/core/dependency_injection/injection.dart';
import '../../localization/localized_strings.dart';

class CustomMessageDialog {
  static void error({required String? message}) {
    final dialogService = injection<DialogService>();

    dialogService.showDialog(
      title: message ?? LocalizedStrings.somethingWentWrong,
      dialogPlatform: DialogPlatform.Cupertino,
    );
  }

  static dialog({
    String? title,
    String? description,
    required String buttonTitle,
    String? cancelTitle,
    Function? buttonAction,
    Function? cancelAction,
  }) async {
    final dialogService = injection<DialogService>();

    if (dialogService.isDialogOpen ?? false) {
      return;
    }

    final response = await dialogService.showDialog(
      title: title,
      description: description,
      cancelTitle: cancelTitle,
      buttonTitle: buttonTitle,
    );

    if (response != null) {
      if (response.confirmed) {
        buttonAction?.call();
      } else {
        cancelAction?.call();
      }
    }
  }
}
