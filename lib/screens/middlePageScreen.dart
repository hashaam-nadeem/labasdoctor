import 'package:flutter/material.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:labasDoctor/utils/Colors.dart';
import 'package:labasDoctor/utils/const.dart';
import 'package:labasDoctor/widgets/card_items.dart';

import 'package:labasDoctor/widgets/counter.dart';
import 'package:labasDoctor/widgets/customWidgets.dart';
import 'package:labasDoctor/widgets/custom_clipper.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class MiddlePage extends StatefulWidget {
  MiddlePage({Key key, this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _MiddlePageState createState() => _MiddlePageState();
}

class _MiddlePageState extends State<MiddlePage> {
  var width, height;
  String dateSelected = "";
  bool apply = false, evening = false, morning = false;
  bool confirm = false;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double headerHeight = 228.5;
    double paddingSide = 30.0;
    String finalDate = '';
    String finalYear = '';
    List months = [
      getTranslated(context, 'January'),
      getTranslated(context, 'February'),
      getTranslated(context, 'March'),
      getTranslated(context, 'April'),
      getTranslated(context, 'May'),
      getTranslated(context, 'June'),
      getTranslated(context, 'July'),
      getTranslated(context, 'August'),
      getTranslated(context, 'September'),
      getTranslated(context, 'October'),
      getTranslated(context, 'November'),
      getTranslated(context, 'December'),
    ];
    var now = new DateTime.now();
    var currentMon = now.month;
    print(months[currentMon - 1]);

    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}";
    var formattedYear = "${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
      finalYear = formattedYear.toString();
    });

    return Scaffold(
        backgroundColor: LabasColor.white,
        bottomSheet: confirm == true ? bottomsheet() : null,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, 0.0),
                end: Alignment(1.0, 0.0),
                colors: [const Color(0xFF6aa6f8), const Color(0xFF1a60be)],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu_rounded),
            color: Colors.white,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        body: Container(
          color: Colors.white,
          width: width,
          height: height,
          child: apply == false
              ? Center(
                  child: GestureDetector(
                    onTap: () async {
                      await picker
                          .showMaterialDatePicker(
                        context: context,
                        initialDate: NepaliDateTime.now(),
                        firstDate: NepaliDateTime(2000),
                        lastDate: NepaliDateTime(2090),
                        initialDatePickerMode: DatePickerMode.day,
                      )
                          .then((date) {
                        if (date != null) {
                          setState(() {
                            apply = true;
                            dateSelected =
                                "${date.year}-${date.month}-${date.day}";
                          });
                        } else {}
                      });
                    },
                    child: Card(
                      elevation: 2,
                      color: mainColor,
                      child: Container(
                        width: width * .4,
                        height: height * .08,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mainColor),
                        child: Center(
                          child: Text(
                            "Cancel Time Table",
                            style: textStyle14.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              morning = !morning;
                            });
                          },
                          child: Card(
                            elevation: 3,
                            color: Colors.green,
                            child: Container(
                              width: width * .8,
                              height: height * .08,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Morning",
                                    style: textStyle14.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  morning == true
                                      ? Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )
                                          ],
                                        )
                                      : Container(),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              evening = !evening;
                            });
                          },
                          child: Card(
                            elevation: 3,
                            color: Colors.blue[400],
                            child: Container(
                              width: width * .8,
                              height: height * .08,
                              decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Evening",
                                    style: textStyle14.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  evening == true
                                      ? Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )
                                          ],
                                        )
                                      : Container(),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (morning == false && evening == false) {
                              constValues().toast("Select Time Slots", context);
                            } else {
                              setState(() {
                                confirm = true;
                              });
                            }
                          },
                          child: Card(
                            elevation: 3,
                            color: Colors.white,
                            child: Container(
                              width: width * .5,
                              height: height * .08,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: textStyle14.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: mainColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ));
  }

  Widget bottomsheet() {
    return Card(
      elevation: 3,
      child: Container(
          height: MediaQuery.of(context).size.height * .3,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 10,
              right: 10,
              left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        confirm = false;
                      });
                    },
                    child: Icon(Icons.close, size: height * .04),
                  )
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        confirm = false;
                      });
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        width: width * .3,
                        height: height * .06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: Text("Cancel",
                              style: textStyle14.copyWith(
                                  fontSize: 16,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BASEHELPER()
                          .applyLeave(evening == true ? 1 : 0,
                              morning == true ? 1 : 0, dateSelected, context)
                          .then((value) {
                        print("leave response: $value");
                        if (value['error'] == false) {
                          setState(() {
                            apply = false;
                            evening = false;
                            morning = false;
                            confirm = false;
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
                          //               child:
                          //             );
                          //           });
                          //     },
                          //     transitionDuration: Duration(milliseconds: 500),
                          //   ),
                          // );
                        } else {
                          setState(() {
                            apply = false;
                            evening = false;
                            morning = false;
                            confirm = false;
                          });
                          constValues().toast("${value['message']}", context);
                        }
                      }).catchError((error) {
                        setState(() {
                          apply = false;
                          evening = false;
                          morning = false;
                          confirm = false;
                        });
                        constValues().toast("$error", context);
                      });
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        width: width * .3,
                        height: height * .06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                          child: Text("Confirm",
                              style: textStyle14.copyWith(
                                  fontSize: 16,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
