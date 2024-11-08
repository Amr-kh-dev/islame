import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviedSetting with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languegeCode = 'en';
  bool get isDark => themeMode == ThemeMode.dark;
  String get backgroundImage => isDark ? 'dark_bg.png' : 'default_bg.png';
  ProviedSetting() {
    getTheme();
    notifyListeners();
  }
  changeTheme(ThemeMode selcetedTheme) {
    if (selcetedTheme == themeMode) return;
    themeMode = selcetedTheme;
    saveThemes(selcetedTheme);

    notifyListeners();
  }

  changeLanguege(String selcetedLanguege) {
    if (selcetedLanguege == languegeCode) return;
    languegeCode = selcetedLanguege;
    notifyListeners();
  }

  void saveThemes(ThemeMode theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", 'light');
    prefs.setString("theme", 'dark');
  }



  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cachedTheme = prefs.getString('theme') ?? 'light';
    if (cachedTheme == 'light') {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }


  void savelocal(ThemeMode theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lacal", 'en');
    prefs.setString("lacal", 'ar');
  }

  void getlocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cachedlocal = prefs.getString('lacal') ?? 'en';
    if (cachedlocal == 'en') {
      languegeCode ='en' ;
    } else {
      languegeCode = 'ar';
    }
  }

}
