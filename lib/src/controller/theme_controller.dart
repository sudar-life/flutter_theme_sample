import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final SharedPreferences prefs;
  ThemeController(this.prefs);
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  void init(ThemeMode mode) {
    var isDarkModeData = isDarkMode();
    if (isDarkModeData == null) {
      updateMode(mode);
    } else {
      updateMode(isDarkModeData ? ThemeMode.dark : ThemeMode.light);
    }
  }

  void updateMode(ThemeMode mode, {bool isSaveLocalData = false}) {
    themeMode(mode);
    if (isSaveLocalData) {
      saveLocalThemeMode();
    }
  }

  void saveLocalThemeMode() {
    prefs.setBool('isDarkMode', themeMode.value == ThemeMode.dark);
  }

  bool? isDarkMode() {
    return prefs.getBool('isDarkMode');
  }
}
