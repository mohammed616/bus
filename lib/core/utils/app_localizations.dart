import 'package:flutter/material.dart';

class AppLocalizations {
  static Map<String, String> _localizedValues = {
    'login': 'تسجيل الدخول',
    'register': 'التسجيل',
  };

  String translate(String key) {
    return _localizedValues[key] ?? key;
  }
}



class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'ar';
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations();
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}