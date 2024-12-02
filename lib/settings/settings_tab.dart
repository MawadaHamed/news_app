import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:flutter_application_1/settings/language.dart';
import 'package:flutter_application_1/settings/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربيه', code: 'ar')
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<Language>(
                value: languages.firstWhere((Language) =>
                    Language.code == settingProvider.languageCode),
                items: languages
                    .map((Language) => DropdownMenuItem(
                          child: Text(
                            Language.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          value: Language,
                        ))
                    .toList(),
                onChanged: (selectedLanguage) {
                  if (selectedLanguage != null)
                    return settingProvider
                        .changeLanguage(selectedLanguage.code);
                  settingProvider.language();
                },
                borderRadius: BorderRadius.circular(20),
                dropdownColor: AppTheme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
