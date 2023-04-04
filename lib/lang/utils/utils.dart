import 'package:flutter/material.dart';

class Utils {
  static String localeToCountryName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'id':
        return 'Indonesia';
      case 'es':
        return 'Espanol';
      case 'ar':
        return 'عربي';
      case 'de':
        return 'German';
      default:
        return 'English';
    }
  }
}
