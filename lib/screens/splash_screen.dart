import 'dart:async';
import 'package:flutter/material.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/models/userdatamodel.dart';
import 'package:labasDoctor/provider/widget_provider.dart';
import 'package:labasDoctor/screens/home.dart';
import 'package:labasDoctor/screens/loginScreen.dart';
import 'package:labasDoctor/utils/const.dart';
import 'package:labasDoctor/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  final languageCode;

  const Splash({
    Key key,
    this.languageCode,
  }) : super(key: key);
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    if (widget.languageCode == "ar") {
      Provider.of<WidgetProvider>(context, listen: false)
          .changeLanguageIndex(2);
    } else {
      Provider.of<WidgetProvider>(context, listen: false)
          .changeLanguageIndex(1);
    }
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    getseesion();
  }

  getseesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mobile = prefs.getString("mobile");
    var pass = prefs.getString("password");
    if (mobile == null || pass == null) {
      startTime();
    } else {
      BASEHELPER().sessionHandling(mobile, pass, context).then((value) {
        print("login response: $value");
        if (value['error'] == false) {
          UserDataModel userDataModel = UserDataModel.fromJson(value['user']);
          User.userData.userResult = userDataModel.result;
          User.userData.token = value['access_token'];
          constValues().setsharedpreferencedata(mobile, pass, "en");
          AppRoutes.makeFirst(context, Home());
          // Navigator.of(context).push(
          //   PageRouteBuilder<Null>(
          //     pageBuilder: (BuildContext context, Animation<double> animation,
          //         Animation<double> secondaryAnimation) {
          //       return AnimatedBuilder(
          //           animation: animation,
          //           builder: (BuildContext context, Widget child) {
          //             return Opacity(
          //               opacity: animation.value,
          //               child:
          //             );
          //           });
          //     },
          //     transitionDuration: Duration(milliseconds: 500),
          //   ),
          // );
        } else {
          startTime();
          constValues().toast("${value['message']}", context);
        }
      }).catchError((error) {
        startTime();
        constValues().toast("$error", context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: new Image.asset(
                    'assets/images/logo/logo_transparent.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo/logo_transparent.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
