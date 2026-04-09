import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/models/userdatamodel.dart';
import 'package:labasDoctor/provider/widget_provider.dart';
import 'package:labasDoctor/screens/forgotPasswordScreen.dart';
import 'package:labasDoctor/shared/globals.dart';
import 'package:labasDoctor/shared/utils.dart';
import 'package:labasDoctor/utils/Colors.dart';
import 'package:labasDoctor/utils/const.dart';
import 'package:labasDoctor/utils/routes.dart';
import 'package:labasDoctor/widgets/animated_toggle_button.dart';
import 'package:labasDoctor/widgets/delayed_animation.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  bool isArabicMode = false;
  bool visible = false;
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  AnimationController _loginButtonController;
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

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      BASEHELPER().loginUser(mobile.text, password.text, context).then((value) {
        print("login response: $value");
        if (value['error'] == false) {
          UserDataModel userDataModel = UserDataModel.fromJson(value['user']);
          User.userData.userResult = userDataModel.result;
          User.userData.token = value['access_token'];
          constValues()
              .setsharedpreferencedata(mobile.text, password.text, "en");
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
          constValues().toast("${value['message']}", context);
        }
      }).catchError((error) {
        constValues().toast("$error", context);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  String _phoneNo, _password;
  final int delayedAmount = 500;

  Widget _buildPhoneTF() {
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
            controller: mobile,
            maxLength: 8,
            validator: (input) =>
                input.isEmpty || input.length < 8 || input.length > 8
                    ? 'Please enter a valid Phone Number'
                    : null,
            onSaved: (input) => _phoneNo = input,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
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
              counterText: "",
              hintText: getTranslated(context, 'PhoneNumber'),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

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
            validator: (input) =>
                input.length < 6 ? 'Must be at least 6 characters' : null,
            onSaved: (input) => _password = input,
            obscureText: true,
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
              hintText: getTranslated(context, 'Password'),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder<Null>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: ForgotPassword(),
                      );
                    });
              },
              transitionDuration: Duration(milliseconds: 500),
            ),
          );
        },
        child: Text(
          getTranslated(context, 'ForgotPassword?'),
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _submit,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0, color: Colors.lightBlue.shade50),
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF61A4F1),
        child: Text(
          getTranslated(context, 'Login'),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  List<String> tempList = ['English', 'العربية'];

  @override
  Widget build(BuildContext context) {
    WidgetProvider _widgetProvider = Provider.of<WidgetProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: kBoxDecorationColor,
        height: height,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * .03,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * .06,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DelayedAnimation(
                                child: AnimatedToggle(
                                  values: tempList,
                                  textColor: _widgetProvider.languageIndex == 2
                                      ? arabicMode.textColor
                                      : englishMode.textColor,
                                  backgroundColor:
                                      _widgetProvider.languageIndex == 2
                                          ? arabicMode.toggleBackgroundColor
                                          : englishMode.toggleBackgroundColor,
                                  buttonColor:
                                      _widgetProvider.languageIndex == 2
                                          ? arabicMode.toggleButtonColor
                                          : englishMode.toggleButtonColor,
                                  shadows: _widgetProvider.languageIndex == 2
                                      ? arabicMode.shadow
                                      : englishMode.shadow,
                                  onToggleCallback: (index) {
                                    print(index);
                                    print(_widgetProvider.languageIndex);
                                  },
                                ),
                              ),
                            ],
                          ),
                          DelayedAnimation(
                            delay: delayedAmount + 1000,
                            child: SizedBox(
                              height: width * .7,
                              width: width * 7,
                              child: Image.asset(
                                logo,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * .1,
                            ),
                            child: Column(
                              children: [
                                _buildPhoneTF(),
                                SizedBox(
                                  height: 10,
                                ),
                                _buildPasswordTF(),
                                SizedBox(
                                  height: 5,
                                ),
                                _buildForgotPasswordBtn(context),
                                _buildLoginBtn(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * .3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     DelayedAnimation(
//       child: AnimatedToggle(
//         values: tempList,
//         textColor: _widgetProvider.languageIndex == 2
//             ? arabicMode.textColor
//             : englishMode.textColor,
//         backgroundColor:
//             _widgetProvider.languageIndex == 2
//                 ? arabicMode.toggleBackgroundColor
//                 : englishMode.toggleBackgroundColor,
//         buttonColor:
//             _widgetProvider.languageIndex == 2
//                 ? arabicMode.toggleButtonColor
//                 : englishMode.toggleButtonColor,
//         shadows: _widgetProvider.languageIndex == 2
//             ? arabicMode.shadow
//             : englishMode.shadow,
//         onToggleCallback: (index) {
//           print(index);
//           print(_widgetProvider.languageIndex);
//         },
//       ),
//     ),
//   ],
// ),
