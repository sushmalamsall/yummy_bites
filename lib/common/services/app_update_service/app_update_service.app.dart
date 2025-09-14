import 'package:url_launcher/url_launcher_string.dart';
import 'package:yummy_bites/common/utils/ui_utils.dart';

Future<void> updateApp() async {
  String url = _updateURL();

  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  }
}

String _updateURL() {
  if (UIUtils.isAndroid) {
    return "https://play.google.com/store/apps/details?id=com.ciaogg.app&hl=en&pli=1";
  }

  if (UIUtils.isIOS || UIUtils.isMacOS) {
    return "https://apps.apple.com/us/app/ciaogg/id6737302688";
  }

  return "https://www.ciaogg.com";
}
