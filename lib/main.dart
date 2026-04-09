import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/provider/widget_provider.dart';
import 'package:labasDoctor/screens/middlePageScreen.dart';

import 'package:labasDoctor/screens/splash_screen.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labasDoctor/utils/Colors.dart';

import 'helper/routes.dart';

import 'language/appLocalizatin.dart';

import 'state/appState.dart';

import 'package:provider/provider.dart';

void dialogBox() {
  EasyLoading.instance
    ..backgroundColor = Colors.white.withOpacity(0.4)
    ..progressColor
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10
    ..textColor = Colors.white
    ..indicatorColor = mainColor
    ..dismissOnTap = true
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..indicatorSize = 100;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  dialogBox();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  var languageCode;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      languageCode = _locale.languageCode;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
        languageCode = _locale.languageCode;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>(
            create: (_) => AppState(),
          ),
          ChangeNotifierProvider<WidgetProvider>(
            create: (_) => WidgetProvider(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
          builder: EasyLoading.init(),
          title: 'LABAS DOCTOR',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.apptheme.copyWith(
            textTheme: GoogleFonts.muliTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: Splash(
            languageCode: _locale.languageCode,
          ),
          locale: _locale,
          supportedLocales: [
            Locale("en", "US"),
            Locale("ar", "SA"),
          ],
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
          onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
        ),
      ),
    );
  }
}
