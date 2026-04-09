import 'package:flutter/material.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/main.dart';

void changeLanguage(String language, BuildContext context) async {
  Locale _locale = await setLocale(language);
  MyApp.setLocale(context, _locale);
}
