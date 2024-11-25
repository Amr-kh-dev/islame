import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabs/settings/language.dart';
import 'package:flutter_application_1/provider/provied_setting.dart';
import 'package:flutter_application_1/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Languages> languages = [
      Languages(name: AppLocalizations.of(context)!.english, code: 'en'),
      Languages(name: AppLocalizations.of(context)!.arabic, code: 'ar'),
    ];

    final settingProvider = Provider.of<ProviedSetting>(context);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          _buildDarkModeToggle(context, settingProvider),
          _buildLanguageSelector(context, settingProvider, languages),
        ],
      ),
    );
  }

  /// Builds the dark mode toggle row.
  Widget _buildDarkModeToggle(
      BuildContext context, ProviedSetting settingProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.darkMode,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Switch(
          value: settingProvider.isDark,
          onChanged: (value) {
            settingProvider.changeTheme(
              value ? ThemeMode.dark : ThemeMode.light,
            );
          },
          activeTrackColor: ThemeApp.gold,
        ),
      ],
    );
  }

  /// Builds the language selector row.
  Widget _buildLanguageSelector(BuildContext context,
      ProviedSetting settingProvider, List<Languages> languages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<Languages>(
            value: languages.firstWhere(
              (lang) => lang.code == settingProvider.languegeCode,
            ),
            items: languages
                .map(
                  (language) => DropdownMenuItem<Languages>(
                    value: language,
                    child: Text(
                      language.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                )
                .toList(),
            onChanged: (selectedLanguage) {
              if (selectedLanguage != null) {
                settingProvider.changeLanguege(selectedLanguage.code);
              }
            },
            borderRadius: BorderRadius.circular(25),
            dropdownColor: settingProvider.isDark
                ? ThemeApp.gold
                : const Color.fromARGB(255, 201, 193, 193),
          ),
        ),
      ],
    );
  }
}
