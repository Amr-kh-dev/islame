import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabs/settings/language.dart';
import 'package:flutter_application_1/tabs/settings/provied_setting.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Languages> language = [
      Languages(name: AppLocalizations.of(context)!.english, code: 'en'),
      Languages(name: AppLocalizations.of(context)!.arabic, code: 'ar')
    ];

    ProviedSetting settingProvieder = Provider.of<ProviedSetting>(context);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.darkMode,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Switch(
                value: settingProvieder.isDark,
                onChanged: (value) => settingProvieder
                    .changeTheme(value ? ThemeMode.dark : ThemeMode.light),
                activeTrackColor: ThemeApp.gold,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: language.firstWhere((Languages) =>
                        Languages.code == settingProvieder.languegeCode),
                    items: language
                        .map((language) => DropdownMenuItem(
                            value: language,
                            child: Text(
                              language.name,
                              style: Theme.of(context).textTheme.labelLarge,
                            )))
                        .toList(),
                    onChanged: (selectedLanguage) {
                      if (selectedLanguage != null) {
                        settingProvieder.changeLanguege(selectedLanguage.code);
                      }
                    },
                    borderRadius: BorderRadius.circular(25),
                    dropdownColor: settingProvieder.isDark
                        ? ThemeApp.gold
                        : const Color.fromARGB(255, 201, 193, 193)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
