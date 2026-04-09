import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:labasDoctor/language/language_constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class constValues {
  void toast(String text, BuildContext context) {
    showToast('$text',
        context: context,
        curve: Curves.easeIn,
        textStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        animation: StyledToastAnimation.slideFromLeft,
        axis: Axis.horizontal,
        alignment: Alignment.topCenter,
        position: StyledToastPosition.top);
  }

  void setsharedpreferencedata(mobile, password, String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("mobile", mobile);
    await prefs.setString("password", password);
  }

  void changeLanguage(String language, BuildContext context) async {
    Locale _locale = await setLocale(language);
    MyApp.setLocale(context, _locale);
  }
}

TextStyle _textStyle(
    String fontFamily, Color color, double size, FontWeight fontWeight) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: size,
      fontWeight: fontWeight);
}
