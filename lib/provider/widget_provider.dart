import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
  int languageIndex;
  changeLanguageIndex(int index) {
    languageIndex = index;
    notifyListeners();
  }

  bool initialPosition;
  changeInitialPosition(bool position) {
    initialPosition = position;
    notifyListeners();
  }

  int toggleIndex;
  changeToggleIndex(int index) {
    toggleIndex = index;
  }

  WidgetProvider() {
    languageIndex = 1;
    initialPosition = true;
    toggleIndex = 0;
  }
}
