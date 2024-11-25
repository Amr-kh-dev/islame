import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabs/hadeth/hadeth_contant_screen.dart';
import 'package:flutter_application_1/tabs/quran/sura_contant.dart';
import 'package:flutter_application_1/provider/provied_setting.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ProviedSetting(), child: const IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProviedSetting settingProvieder = Provider.of<ProviedSetting>(context);
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        SuraContant.routeName: (context) => const SuraContant(),
        HadethContantScreen.routeName: (context) => const HadethContantScreen(),
      },
      initialRoute: '/',
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode: settingProvieder.theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvieder.languegeCode),
    );
  }
}
