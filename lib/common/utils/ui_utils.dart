import 'dart:io';

import 'package:flutter/foundation.dart';

class UIUtils {
  static bool get isWeb => kIsWeb;
  static bool get isDebugMode => !isWeb && kDebugMode;

  static bool get isAndroid => !isWeb && Platform.isAndroid;

  static bool get isIOS => !isWeb && Platform.isIOS;

  static bool get isMobile => !isWeb && (Platform.isIOS || Platform.isAndroid);

  static bool get isMacOS => !isWeb && Platform.isMacOS;

  static bool get isWindows => !isWeb && Platform.isWindows;

  static bool get isLinux => !isWeb && Platform.isLinux;

  static bool get isDesktop =>
      !isWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

  static String get operatingSystem => isWeb ? "web" : Platform.operatingSystem;

  static bool get isNotificationSupported => isAndroid || isIOS;
}
