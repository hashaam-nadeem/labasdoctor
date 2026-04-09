import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labasDoctor/provider/widget_provider.dart';
import 'package:labasDoctor/shared/theme.dart';

import 'package:labasDoctor/widgets/custom_clipper.dart';
import 'package:provider/provider.dart';

class CardItems extends StatelessWidget {
  final Image image;
  final String title;
  final String value;
  final String unit;
  final Color color;

  CardItems({
    Key key,
    @required this.image,
    @required this.title,
    this.value,
    this.unit,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var _widgetProvider = Provider.of<WidgetProvider>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 90,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 30,
            color: Colors.grey.withOpacity(.16),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: _widgetProvider.languageIndex == 2
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(
                          width * .1,
                        ),
                        topLeft: Radius.circular(
                          width * .1,
                        ),
                      )
                    : BorderRadius.only(
                        bottomRight: Radius.circular(
                          width * .1,
                        ),
                        topRight: Radius.circular(
                          width * .1,
                        ),
                      ),
                color: color.withOpacity(0.1),
              ),
              height: 100,
              width: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Icon and Hearbeat
                image,
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '$title',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 30,
                              color: LabasColor.dodgetBlue,
                            ),
                          ),
                          /* Text(
                            '$value $unit',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),*/
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppIcons {}
