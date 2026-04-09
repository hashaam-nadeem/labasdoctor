import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:labasDoctor/helper/basehelper.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/appointmentmodel.dart';
import 'package:labasDoctor/models/patienthistorymodel.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:labasDoctor/utils/Colors.dart';
import 'package:labasDoctor/widgets/customWidgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PatientHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PatientHistory();
  }
}

class _PatientHistory extends State<PatientHistory> {
  var width, height;
  DateTime date = DateTime.now();
  String currentDate = "";
  @override
  void initState() {
    super.initState();
    setState(() {
      currentDate = "${date.year}-${date.month}-${date.day}";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Appointment",
            style: textStyle14.copyWith(
                fontSize: 18, color: mainColor, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
          brightness: Brightness.light,
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
                color: mainColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          width: width,
          height: height,
          child: Column(
            children: [
              FutureBuilder<List<AppointmentResult>>(
                future: BASEHELPER().patientAppointment(currentDate, context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length != 0) {
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 15.0, left: 15, right: 15),
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${snapshot.data[index].appointmentDate}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Patient Name: ${snapshot.data[index].patientProfile.name}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
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
                                              fontWeight: FontWeight.bold),
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
                                              fontWeight: FontWeight.bold),
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
                        height: MediaQuery.of(context).size.height * .7,
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
            ],
          ),
        ));
  }
}
