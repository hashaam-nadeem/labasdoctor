import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/shared/utils.dart';
import 'package:labasDoctor/utils/const.dart';
import 'package:labasDoctor/utils/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'newPasswordScreen.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: Color(0xFFBBDEFB),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF61A4F1),
              size: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: kBoxDecorationColor,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 90),
              Container(
                height: 180,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Constants.avatarRadius)),
                    child: Image.asset("assets/images/ph_verification.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  getTranslated(context, 'PhoneNumberVerification'),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: getTranslated(context, 'Enterthecodesentto'),
                      children: [
                        TextSpan(
                            text: widget.phoneNumber,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: false,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 4) {
                          return "Enter enter valid code";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        inactiveColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 60,
                        fieldWidth: 50,
                        activeFillColor: hasError ? Colors.red : Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      textStyle: TextStyle(fontSize: 20, height: 1.6),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  BASEHELPER()
                      .requestOTP(widget.phoneNumber, context)
                      .then((value) {
                    print("otp response: $value");
                    if (value['error'] == false) {
                      constValues().toast("${value['message']}", context);

                      //     setState(() {
                      //   User.userData.otp = mobile.text;
                      // });
                    } else {
                      constValues().toast("${value['message']}", context);
                    }
                  }).catchError((error) {
                    constValues().toast("$error", context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(getTranslated(context, "Didntreceivethecode?")),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      getTranslated(context, "Resend"),
                      style: TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0, color: Colors.lightBlue.shade50),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      formKey.currentState.validate();

                      BASEHELPER()
                          .verifyOTP(widget.phoneNumber, currentText, context)
                          .then((value) {
                        print("verify otp response: $value");
                        if (value['error'] == false) {
                          //constValues().toast("${value['message']}", context);
                          setState(() {
                            User.userData.otp = currentText;
                            User.userData.mobile = widget.phoneNumber;
                          });
                          AppRoutes.replace(context, NewPassword());
                        } else {
                          constValues().toast("${value['message']}", context);
                        }
                      }).catchError((error) {
                        constValues().toast("$error", context);
                      });
                      // Navigator.of(context).push(
                      //   PageRouteBuilder<Null>(
                      //     pageBuilder: (BuildContext context,
                      //         Animation<double> animation,
                      //         Animation<double> secondaryAnimation) {
                      //       return AnimatedBuilder(
                      //           animation: animation,
                      //           builder:
                      //               (BuildContext context, Widget child) {
                      //             return Opacity(
                      //               opacity: animation.value,
                      //               child: NewPassword(),
                      //             );
                      //           });
                      //     },
                      //     transitionDuration: Duration(milliseconds: 500),
                      //   ),
                      // );
                    },
                    child: Center(
                        child: Text(
                      getTranslated(context, "Verify"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
