import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/screens/patienthistory.dart';
import 'package:labasDoctor/utils/routes.dart';
import 'package:labasDoctor/widgets/custom_clipper.dart';

class CardMain extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String value;
  final String unit;
  final Color color;

  CardMain(
      {Key key,
      this.image,
      @required this.title,
      @required this.value,
      this.unit,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double L = 100; // image side length
    double R = 24; // rounding radius
    double k = sqrt(2) - R / L * 2 * (sqrt(2) - 1);
    return Align(
      alignment: Alignment.topLeft,
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Transform.scale(
          scale: k,
          child: Container(
            // margin: const EdgeInsets.only(right: 15.0),
            width:
                ((MediaQuery.of(context).size.width - (30.0 * 2 + 30.0 / 2)) /
                    2),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.rectangle,
              color: color,
            ),
            child: Material(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  overflow: Overflow.clip,
                  children: <Widget>[
                    Positioned(
                      child: ClipPath(
                        clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black.withOpacity(0.03),
                          ),
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Icon and Hearbeat
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                width: 32,
                                height: 32,
                                image: image,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onTap: () {
                  print(User.userData.token);
                  AppRoutes.push(context, PatientHistory());
                  debugPrint("CARD main clicked. redirect to details page");
                },
              ),
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
