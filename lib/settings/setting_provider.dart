import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  String languageCode = 'en';

  void changeLanguage(String selectedLanguage) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (selectedLanguage == languageCode) return;
    languageCode = selectedLanguage;
    pref.setString('savelang', languageCode);
    notifyListeners();
  }

  void language() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    languageCode = pref.getString('savelang') ?? languageCode;
    notifyListeners();
  }
}
