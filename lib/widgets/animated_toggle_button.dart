import 'package:flutter/material.dart';
import 'package:labasDoctor/provider/widget_provider.dart';
import 'package:labasDoctor/shared/globals.dart';
import 'package:provider/provider.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  final List<BoxShadow> shadows;

  AnimatedToggle({
    @required this.values,
    @required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.shadows = const [
      BoxShadow(
        color: const Color(0xFFd8d7da),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  });
  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;

  List<String> tempList = ['English', 'العربية'];

  @override
  Widget build(BuildContext context) {
    double toggleWidth = (MediaQuery.of(context).size.width * 0.7);
    WidgetProvider _widgetProvider = Provider.of<WidgetProvider>(context);
    double width = MediaQuery.of(context).size.width;
    print(tempList);
    return Container(
      width: toggleWidth * 0.7,
      height: toggleWidth * 0.13,
      margin: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              _widgetProvider.changeInitialPosition(initialPosition);
              _widgetProvider.changeToggleIndex(0);
              if (_widgetProvider.languageIndex == 2) {
                changeLanguage('en', context);
                _widgetProvider.changeLanguageIndex(1);
              }
              if (!initialPosition) {
                _widgetProvider.changeToggleIndex(1);
                if (_widgetProvider.languageIndex == 1) {
                  changeLanguage('ar', context);
                  _widgetProvider.changeLanguageIndex(2);
                }
              }
              widget.onToggleCallback(_widgetProvider.toggleIndex);

              setState(() {});
            },
            child: Container(
              width: toggleWidth * 0.7,
              height: toggleWidth * 0.13,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(toggleWidth * 0.1),
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _widgetProvider.toggleIndex == 0
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: width * .1,
                              ),
                              child: Text(
                                'العربية',
                                style: TextStyle(
                                  fontSize: toggleWidth * 0.045,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width * .1,
                              ),
                              child: Text(
                                'English',
                                style: TextStyle(
                                  fontSize: toggleWidth * 0.045,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                    _widgetProvider.toggleIndex == 1
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width * .1,
                              ),
                              child: Text(
                                'English',
                                style: TextStyle(
                                  fontSize: toggleWidth * 0.045,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: width * .08,
                              ),
                              child: Text(
                                'العربية',
                                style: TextStyle(
                                  fontSize: toggleWidth * 0.045,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                  ]),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: toggleWidth * 0.35,
              height: toggleWidth * 0.13,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shadows: widget.shadows,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(toggleWidth * 0.1),
                ),
              ),
              child: Center(
                child: Text(
                  initialPosition ? widget.values[0] : widget.values[1],
                  style: TextStyle(
                    fontSize: toggleWidth * 0.045,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
