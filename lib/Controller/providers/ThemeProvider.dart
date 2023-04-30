import 'package:flutter/material.dart';

import '../../Modals/ThemeModal.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModal themeModal = ThemeModal(isDark: false);

  changeTheme() {
    themeModal.isDark = !themeModal.isDark;
    notifyListeners();
  }
}
