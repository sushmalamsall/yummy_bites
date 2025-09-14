import 'package:flutter/services.dart';

class AssetLoadUtils {
  static Future<String> loadString(String path) async {
    return rootBundle.loadString(path);
  }

  static Future<ByteData> load(String path) async {
    return rootBundle.load(path);
  }
}
