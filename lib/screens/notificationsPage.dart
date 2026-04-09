import 'package:flutter/material.dart';
import 'package:labasDoctor/dummyData/constants.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/notificationModel.dart';
import 'package:labasDoctor/models/schedulemodel.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:labasDoctor/utils/Colors.dart';

import 'package:labasDoctor/widgets/customAppBar.dart';
import 'package:labasDoctor/widgets/customWidgets.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key, this.scaffoldKey}) : super(key: key);

  /// scaffoldKey used to open sidebaar drawer
  final GlobalKey<ScaffoldState> scaffoldKey;

  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var width, height;
  int selectedIndex = 0;
  bool selected = false;
  List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wed",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: [
                const Color(0xFF6aa6f8),
                const Color(0xFF1a60be),
              ],
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
      body: FutureBuilder<ScheduleModel>(
        future: BASEHELPER().timeSchedule(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: width,
              height: height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = false;
                          });
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                            width: width * .3,
                            height: height * .06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selected == false
                                    ? mainColor
                                    : Colors.white),
                            child: Center(
                              child: Text(
                                "Morning",
                                style: textStyle14.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: selected == false
                                        ? Colors.white
                                        : mainColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = true;
                          });
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                            width: width * .3,
                            height: height * .06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selected == true
                                    ? mainColor
                                    : Colors.white),
                            child: Center(
                              child: Text(
                                "Evening",
                                style: textStyle14.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: selected == true
                                        ? Colors.white
                                        : mainColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        width: width * .3,
                        margin: EdgeInsets.only(top: height * .02),
                        height: height * .65,
                        color: Colors.white,
                        child: ListView.builder(
                          itemBuilder: (context, int index) {
                            return GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   selectedIndex = index;
                                // });
                              },
                              child: Card(
                                color: mainColor.withOpacity(0.5),
                                elevation: 3,
                                child: Container(
                                  width: width * .25,
                                  height: height * .08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: mainColor.withOpacity(0.5)),
                                  child: Center(
                                    child: Text(
                                      "${snapshot.data.morningSchedule[index].day}",
                                      style: textStyle14.copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data.morningSchedule.length,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(10),
                          width: width * .7,
                          height: height * .74,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Start Time",
                                    style: textStyle14.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "End Time",
                                    style: textStyle14.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, int index) {
                                    return Container(
                                      height: height * .095,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              selected == false
                                                  ? "${snapshot.data.morningSchedule[index].startTime}"
                                                  : "${snapshot.data.eveningSchedule[index].startTime}",
                                              style: textStyle14.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: mainColor),
                                            ),
                                            Text(
                                              selected == false
                                                  ? "${snapshot.data.morningSchedule[index].endTime}"
                                                  : "${snapshot.data.eveningSchedule[index].endTime}",
                                              style: textStyle14.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: mainColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: selected == false
                                      ? snapshot.data.morningSchedule.length
                                      : snapshot.data.eveningSchedule.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
