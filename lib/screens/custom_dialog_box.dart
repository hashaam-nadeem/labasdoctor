import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:labasDoctor/shared/utils.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import 'newPasswordScreen.dart';

class CustomDialogBox extends StatefulWidget {
  final String phoneNumber;

  const CustomDialogBox({Key key, this.phoneNumber}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: Constants.padding,
                top: Constants.avatarRadius + Constants.padding,
                right: Constants.padding,
                bottom: Constants.padding),
            margin: EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(Constants.padding),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: widget.phoneNumber,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style: TextStyle(color: Colors.black54, fontSize: 15)),
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
                        length: 6,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 3) {
                            return "Enter the full code";
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
                        backgroundColor: Color(0xFFBBDEFB),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Didn't receive the code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                      children: [
                        TextSpan(
                            text: " RESEND",
                            recognizer: onTapRecognizer,
                            style: TextStyle(
                                color: Colors.black54,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ]),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: ButtonTheme(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        formKey.currentState.validate();

                        if (currentText.length != 6 ||
                            currentText != "123456") {
                          errorController.add(ErrorAnimationType.shake);
                          setState(() {
                            hasError = true;
                          });
                        } else {
                          setState(() {
                            hasError = false;
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Success!!"),
                              duration: Duration(seconds: 2),
                            ));
                          });
                          Navigator.of(context).push(
                            PageRouteBuilder<Null>(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return AnimatedBuilder(
                                    animation: animation,
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return Opacity(
                                        opacity: animation.value,
                                        child: NewPassword(),
                                      );
                                    });
                              },
                              transitionDuration: Duration(milliseconds: 500),
                            ),
                          );
                        }
                      },
                      child: Center(
                          child: Text(
                        "VERIFY".toUpperCase(),
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
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: Offset(1, -2),
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: Offset(-1, 2),
                            blurRadius: 5)
                      ]),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Clear"),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            left: Constants.padding,
            right: Constants.padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                  child: Image.asset("assets/model.jpeg")),
            ),
          ),
        ],
      ),
    );
  }
}
