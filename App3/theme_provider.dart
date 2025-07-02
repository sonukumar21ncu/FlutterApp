import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark = false;
  bool get isDarkMode => isDark;

  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
