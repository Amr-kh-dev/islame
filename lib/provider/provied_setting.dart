import 'package:flutter/material.dart';

class ProviedSetting with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  String languegeCode = 'en';
  bool get isDark => theme == ThemeMode.dark;
  String get backgroundImage => isDark ? 'dark_bg.png' : 'default_bg.png';
  changeTheme(ThemeMode selcetedTheme) {
    theme = selcetedTheme;
    notifyListeners();
  }

  changeLanguege(String selcetedLanguege) {
    if (selcetedLanguege == languegeCode) return;
    languegeCode = selcetedLanguege;
    notifyListeners();
  }
}
