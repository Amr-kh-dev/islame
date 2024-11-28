import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviedSetting with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  String languegeCode = 'en';
  bool get isDark => theme == ThemeMode.dark;
  bool get isEnglish => languegeCode == 'en';
  String get backgroundImage => isDark ? 'dark_bg.png' : 'default_bg.png';
  changeTheme(ThemeMode selcetedTheme) {
    theme = selcetedTheme;
    saveThemeMod(selcetedTheme);
    notifyListeners();
  }

  changeLanguege(String selcetedLanguege) {
    if (selcetedLanguege == languegeCode) return;
    languegeCode = selcetedLanguege;
    saveLanguege(selcetedLanguege);
    notifyListeners();
  }

  void saveThemeMod(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == ThemeMode.light) {
      prefs.setString('theme', 'light');
    } else {
      prefs.setString('theme', 'dark');
    }
  }

  void getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String chacedTheme = prefs.getString('theme') ?? 'light';
    if (chacedTheme == 'light') {
      theme = ThemeMode.light;
    } else {
      theme = ThemeMode.dark;
    }
  }

  void saveLanguege(String languege) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (languegeCode == "en") {
      prefs.setString('langueg ', 'en');
    } else {
      prefs.setString('langueg', 'ar');
    }
  }

  void getLanguege() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String chacedLanguege = prefs.getString('langueg') ?? 'ar';
    if (chacedLanguege == 'en') {
      languegeCode = 'en';
    } else {
      languegeCode = 'ar';
    }
  }
}
