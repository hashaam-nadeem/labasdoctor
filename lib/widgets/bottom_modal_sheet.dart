import 'package:flutter/material.dart';
import 'package:labasDoctor/provider/widget_provider.dart';
import 'package:labasDoctor/shared/globals.dart';
import 'package:provider/provider.dart';

bottomModalSheet(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var _widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
  return showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(
          width * .08,
        ),
        bottomRight: Radius.circular(
          width * .08,
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    builder: (context) {
      return Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .02,
            ),
            GestureDetector(
              onTap: () {
                changeLanguage('en', context);
                _widgetProvider.changeLanguageIndex(1);
                Navigator.pop(context);
              },
              child: Container(
                height: height * .06,
                width: width * .8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    width * .03,
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * .03,
                      ),
                      Text(
                        'English',
                        style: TextStyle(
                          fontSize: width * .04,
                        ),
                      ),
                      Spacer(),
                      _widgetProvider.languageIndex == 1
                          ? Icon(
                              Icons.done,
                              color: Colors.black,
                            )
                          : SizedBox(),
                      SizedBox(
                        width: width * .03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            GestureDetector(
              onTap: () {
                changeLanguage('ar', context);
                _widgetProvider.changeLanguageIndex(2);
                Navigator.pop(context);
              },
              child: Container(
                height: height * .06,
                width: width * .8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    width * .03,
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * .03,
                      ),
                      Text(
                        'العربية',
                        style: TextStyle(
                          fontSize: width * .04,
                        ),
                      ),
                      Spacer(),
                      _widgetProvider.languageIndex == 2
                          ? Icon(
                              Icons.done,
                              color: Colors.black,
                            )
                          : SizedBox(),
                      SizedBox(
                        width: width * .03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: height * .06,
                width: width * .8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    width * .03,
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: width * .04,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
