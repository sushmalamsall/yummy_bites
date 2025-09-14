class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();
  factory LocalizationService() => _instance;
  LocalizationService._internal();

  Map<String, dynamic> _translations = {};

  void setTranslations(Map<String, dynamic> translations) {
    _translations = translations;
  }

  String translate(String key) {
    return _translations[key] ?? key;
  }
}
