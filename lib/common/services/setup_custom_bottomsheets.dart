import 'package:stacked_services/stacked_services.dart';
import 'package:yummy_bites/common/services/bottom_sheets/update_app.bottom_sheet.dart';
import 'package:yummy_bites/common/utils/ui_utils.dart';

import '../../core/dependency_injection/injection.dart';

enum BottomSheetType { updateApp }

void setupBottomSheets() {
  final bottomSheetService = injection<BottomSheetService>();

  Map<dynamic, SheetBuilder> sheetBuilders = {};

  for (var element in BottomSheetType.values) {
    switch (element) {
      case BottomSheetType.updateApp:
        sheetBuilders[element] = (context, sheetRequest, completer) =>
            UpdateAppBottomSheet(request: sheetRequest, completer: completer);
        break;
    }
  }

  bottomSheetService.setCustomSheetBuilders(sheetBuilders);
}

class CustomBottomSheet {
  static Future<bool> showUpdateApp(bool forceUpdate) async {
    final response = await injection<BottomSheetService>().showCustomSheet(
      variant: BottomSheetType.updateApp,
      barrierDismissible: !forceUpdate,
      data: UIUtils.isDebugMode ? false : forceUpdate,
    );

    return response?.confirmed ?? false;
  }
}
