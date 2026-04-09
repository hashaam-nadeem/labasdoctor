import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/shared/utils.dart';
import 'package:labasDoctor/utils/Colors.dart';
import 'package:labasDoctor/utils/const.dart';
import 'package:labasDoctor/utils/routes.dart';

import 'home.dart';
import 'otpScreen.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNo;
  TextEditingController mobile = TextEditingController();
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
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: "",
              contentPadding: EdgeInsets.only(
                top: 10.0,
                bottom: 5,
              ),
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

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            BASEHELPER().requestOTP(mobile.text, context).then((value) {
              print("otp response: $value");
              if (value['error'] == false) {
                constValues().toast("${value['message']}", context);
                AppRoutes.replace(
                    context, PinCodeVerificationScreen(mobile.text));
                //     setState(() {
                //   User.userData.otp = mobile.text;
                // });
              } else {
                constValues().toast("${value['message']}", context);
              }
            }).catchError((error) {
              constValues().toast("$error", context);
            });
            // Navigator.of(context).push(
            //   PageRouteBuilder<Null>(
            //     pageBuilder: (BuildContext context, Animation<double> animation,
            //         Animation<double> secondaryAnimation) {
            //       return AnimatedBuilder(
            //           animation: animation,
            //           builder: (BuildContext context, Widget child) {
            //             return Opacity(
            //               opacity: animation.value,
            //               child: PinCodeVerificationScreen(_phoneNo),
            //             );
            //           });
            //     },
            //     transitionDuration: Duration(milliseconds: 500),
            //   ),
            // );
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0, color: Colors.lightBlue.shade50),
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF61A4F1),
        child: Text(
          getTranslated(context, 'SendCode'),
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

  Widget _buildSignInWithText() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        getTranslated(context, 'BacktoLogin'),
        style: kLabelStyle,
      ),
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
                        Column(
                          children: [
                            _buildPhoneTF(),
                            _buildLoginBtn(),
                            _buildSignInWithText()
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
