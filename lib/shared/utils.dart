import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

final kHintTextStyle = TextStyle(
  color: Color(0xFF527DAA),
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

//theme gradient
final kBoxDecorationColor = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFBBDEFB),
      Color(0xFFBBDEFB),
      Color(0xFF73AEF5),
      Color(0xFF61A4F1),
    ],
    stops: [0.1, 0.4, 0.7, 0.9],
  ),
);

final String logo = 'assets/images/logo/logo_transparent.png';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class MyColors {
  static const Color primaryColor = Color(0xFF503E9D);
  static const Color primaryColorLight = Color(0xFF73AEF5);
}

class ThemeColor {
  List<Color> gradient;
  Color backgroundColor;
  Color toggleButtonColor;
  Color toggleBackgroundColor;
  Color textColor;
  List<BoxShadow> shadow;

  ThemeColor({
    this.gradient,
    this.backgroundColor,
    this.toggleBackgroundColor,
    this.toggleButtonColor,
    this.textColor,
    this.shadow,
  });
}

ThemeColor englishMode = ThemeColor(
  gradient: [
    const Color(0xDDFF0080),
    const Color(0xDDFF8C00),
  ],
  backgroundColor: const Color(0xFFFFFFFF),
  textColor: const Color(0xFF000000),
  toggleButtonColor: const Color(0xFFFFFFFF),
  toggleBackgroundColor: const Color(0xFFe7e7e8),
  shadow: const [
    BoxShadow(
      color: const Color(0xFFd8d7da),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
);

ThemeColor arabicMode = ThemeColor(
  gradient: [
    const Color(0xDDFF0080),
    const Color(0xDDFF8C00),
  ],
  backgroundColor: const Color(0xFFFFFFFF),
  textColor: const Color(0xFF000000),
  toggleButtonColor: const Color(0xFFFFFFFF),
  toggleBackgroundColor: const Color(0xFFe7e7e8),
  shadow: const [
    BoxShadow(
      color: const Color(0xFFd8d7da),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
);

class AppIcon {
  static const int notification = 0xf055;
  static const int notificationFill = 0xf019;

  static const int home = 0xf053;
  static const int homeFill = 0xF553;

  static const int timelapseIcon = 0xfE192;
  static const int timelapsefill = 0xfE01B;

  static const int messageEmpty = 0xf187;
  static const int messageFill = 0xf554;

  static const int leave = 0xfE62C;

  static const int profile = 0xf056;
  static const int settings = 0xf059;
  static const int blueTick = 0xf099;
  static const int lists = 0xf094;
  static const int bookmark = 0xf155;
  static const int moments = 0xf160;
  static const int bulbOn = 0xf066;
  static const int messageFab = 0xf053;

  static const int fabTweet = 0xf029;

  static const int search = 0xf058;
  static const int searchFill = 0xf558;

  static const int heartEmpty = 0xf148;
  static const int heartFill = 0xf015;

  static const int adTheRate = 0xf064;
  static const int reply = 0xf151;

  static const int image = 0xf109;
  static const int camera = 0xf110;
  static const int arrowDown = 0xf196;

  static const int link = 0xf098;

  static const int mute = 0xf101;
  static const int viewHidden = 0xf156;
  static const int block = 0xe609;
  static const int report = 0xf038;
  static const int pin = 0xf088;
  static const int delete = 0xf154;

  static const int bulb = 0xf567;
  static const int newMessage = 0xf035;

  static const int bulbOff = 0xf567;

  static const int thumbpinFill = 0xf003;
  static const int calender = 0xf203;
  static const int locationPin = 0xf031;
  static const int edit = 0xf112;
}
