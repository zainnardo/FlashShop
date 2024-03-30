import 'package:flutter/cupertino.dart';

class LanguageManager {
  static const enLocale = Locale('en');
  static const idLocale = Locale('id');

  static List<Locale> get supportedLocales => [enLocale, idLocale];
}