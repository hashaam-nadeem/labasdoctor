import 'package:flutter/material.dart';

class Continue extends StatelessWidget {
  Continue();
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 320.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.lightBlue.shade50),
        color: const Color(0xFF61A4F1),
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
      ),
      child: new Text(
        "Continue",
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    ));
  }
}
