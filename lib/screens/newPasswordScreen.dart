import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/screens/loginScreen.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:labasDoctor/shared/utils.dart';
import 'package:labasDoctor/utils/Colors.dart';
import 'package:labasDoctor/utils/const.dart';
import 'package:labasDoctor/utils/routes.dart';
import 'package:labasDoctor/widgets/continueButton.dart';
import 'package:labasDoctor/widgets/loginAnimation.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  TextEditingController password = TextEditingController();
  TextEditingController verifyPassword = TextEditingController();
  var animationStatus = 0;
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  final _formKey = GlobalKey<FormState>();
  String passwordNew, passwordAgain;

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(2),
          height: MediaQuery.of(context).size.height * .08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: mainColor, width: 2)),
          child: TextFormField(
            controller: password,
            obscureText: true,
            onSaved: (input) => passwordNew = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: 10.0,
                bottom: 5,
              ),
              labelText: getTranslated(context, 'NewPassword'),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(2),
          height: MediaQuery.of(context).size.height * .08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: mainColor, width: 2)),
          child: TextFormField(
            controller: verifyPassword,
            obscureText: true,
            // validator: (input) => input.isEmpty ? 'Passwords dont match' : null,
            onSaved: (input) => passwordAgain = input,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: 10.0,
                bottom: 5,
              ),
              labelText: getTranslated(context, 'VerifyPassword'),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: kBoxDecorationColor,
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(logo),
                        SizedBox(height: 30.0),
                        _buildPasswordTF(),
                        _buildNewPasswordTF(),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (password.text.isEmpty) {
                                  constValues()
                                      .toast("password doesn't match", context);
                                } else if (password.text !=
                                    verifyPassword.text) {
                                  constValues()
                                      .toast("password doesn't match", context);
                                } else {
                                  BASEHELPER()
                                      .setPassword(
                                          User.userData.mobile,
                                          User.userData.otp,
                                          password.text,
                                          context)
                                      .then((value) {
                                    print("verify otp response: $value");
                                    if (value['error'] == false) {
                                      //constValues().toast("${value['message']}", context);
                                      constValues().toast(
                                          "${value['message']}", context);
                                      AppRoutes.makeFirst(
                                          context, LoginScreen());
                                    } else {
                                      constValues().toast(
                                          "${value['message']}", context);
                                    }
                                  }).catchError((error) {
                                    constValues().toast("$error", context);
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .5,
                                height:
                                    MediaQuery.of(context).size.height * .06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    color: mainColor),
                                child: Center(
                                  child: Text(
                                    "Continue",
                                    style: textStyle14.copyWith(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
