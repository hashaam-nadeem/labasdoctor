import 'package:flutter/material.dart';
import 'package:labasDoctor/screens/calendersPage.dart';
import 'package:labasDoctor/screens/home.dart';
import 'package:labasDoctor/screens/profile.dart';
import 'package:labasDoctor/screens/settingsAndPrivacyPage.dart';
import 'package:labasDoctor/widgets/customRoute.dart';

import 'package:labasDoctor/widgets/customWidgets.dart';
import 'package:labasDoctor/widgets/loginAnimation.dart';

class Routes {
  static dynamic route() {
    return {};
  }

  static void sendNavigationEventToFirebase(String path) {
    if (path != null && path.isNotEmpty) {}
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case 'home':
        if (pathElements.length > 2) {}

        return MyCustomRoute<bool>(builder: (BuildContext context) => Home());

      case "ProfilePage":
        if (pathElements.length > 2) {}
        return CustomRoute<bool>(
            builder: (BuildContext context) => ProfilePage());
      case "Calender":
        if (pathElements.length > 2) {}

        return CustomRoute<bool>(
            builder: (BuildContext context) => CalendarScreen());
      case "SettingsAndPrivacyPage":
        return CustomRoute<bool>(
          builder: (BuildContext context) => SettingsAndPrivacyPage(),
        );
      default:
        return onUnknownRoute(RouteSettings(name: '/Feature'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: customTitleText(settings.name.split('/')[1]),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name.split('/')[1]} Comming soon..'),
        ),
      ),
    );
  }
}
