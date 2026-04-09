import 'package:flutter/material.dart';
import 'package:labasDoctor/dummyData/constants.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/models/appointmentmodel.dart';
import 'package:labasDoctor/models/date_model.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:labasDoctor/utils/Colors.dart';
import 'package:labasDoctor/widgets/card_main.dart';
import 'package:labasDoctor/widgets/customWidgets.dart';
import 'package:labasDoctor/widgets/sidebar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:labasDoctor/language/language_constants.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key key, this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<DateModel> dates = new List<DateModel>();
  String todayDateIs = "12";
  DateTime date = DateTime.now();
  String currentDate = "";
  @override
  void initState() {
    super.initState();
    setState(() {
      currentDate = "${date.year}-${date.month}-${date.day}";
    });
    dates = getDates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LabasColor.white,
      drawer: SidebarMenu(),
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
        actions: [
          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(context, showTitleActions: true,
                  // minTime: DateTime(2018, 3, 5),
                  // maxTime: DateTime(2019, 6, 7),
                  onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                setState(() {
                  currentDate = "${date.year}-${date.month}-${date.day}";
                });
                print(currentDate);
                BASEHELPER().patientAppointment(currentDate, context);
                print('confirm $date');
              }, currentTime: DateTime.now());
            },
            child: Icon(
              Icons.calendar_today,
              size: MediaQuery.of(context).size.height * .04,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: [const Color(0xFF6aa6f8), const Color(0xFF1a60be)],
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              userHeader(context: context),
              Container(
                margin: const EdgeInsets.only(
                  top: 40.0,
                ),
                decoration: new BoxDecoration(
                  color: LabasColor.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sectionTitle(getTranslated(context, 'Appointments')),
                      ],
                    ),
                    FutureBuilder<List<AppointmentResult>>(
                      future:
                          BASEHELPER().patientAppointment(currentDate, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.length != 0) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                bottom: 15.0,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .8,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  // final item = todayAppointments[index];

                                  return Card(
                                    elevation: 3,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        right: 1.0,
                                        left: 20.0,
                                        top: 5.0,
                                        bottom: 5.0,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Ref No: ${snapshot.data[index].id}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${snapshot.data[index].appointmentDate}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Patient Name: ${snapshot.data[index].patientProfile.name}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Age: ${snapshot.data[index].patientProfile.age}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data[index]
                                                            .patientAvailability ==
                                                        0
                                                    ? "status: Pending"
                                                    : "status: Checked",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .3,
                              child: Center(
                                child: Text(
                                  "${getTranslated(context, "no_appointment")}",
                                  style: textStyle14.copyWith(
                                      fontSize: 18,
                                      color: mainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .12,
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 10,
                    //   ),
                    //   child: Container(
                    //     height: 140,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: <Widget>[
                    //         // GestureDetector(
                    //         //   onTap: () {
                    //         //     print(User.userData.token);
                    //         //   },
                    //         //   child: CardMain(
                    //         //     image:
                    //         //         AssetImage('assets/images/heartbeat.png'),
                    //         //     title: getTranslated(context, 'Hospital'),
                    //         //     value: getTranslated(context, 'Records'),
                    //         //     color: LabasColor.lightGreen,
                    //         //   ),
                    //         // ),
                    //         CardMain(
                    //             title: getTranslated(context, 'Patient'),
                    //             image:
                    //                 AssetImage('assets/images/blooddrop.png'),
                    //             value: getTranslated(context, 'History'),
                    //             color: LabasColor.lightBlue)
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
