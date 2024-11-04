import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabs/hadeth/hadeth_tap.dart';
import 'package:flutter_application_1/tabs/quran/quran.dart';
import 'package:flutter_application_1/tabs/sebha/sebha.dart';
import 'package:flutter_application_1/tabs/radio/radio.dart';
import 'package:flutter_application_1/tabs/settings/provied_setting.dart';
import 'package:flutter_application_1/tabs/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> taps = [Quran(), HadethTap(), Redio(), Sebha(), Settings()];

  @override
  Widget build(BuildContext context) {
    ProviedSetting settingProvieder = Provider.of<ProviedSetting>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image:
                AssetImage('assets/images/${settingProvieder.backgroundImage}'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islame,
              style: settingProvieder.isDark
                  ? Theme.of(context).textTheme.labelLarge
                  : Theme.of(context).textTheme.headlineSmall),
        ),
        body: taps[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radeio),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
            ]),
      ),
    );
  }
}
