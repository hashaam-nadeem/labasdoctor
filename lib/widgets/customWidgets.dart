import 'package:flutter/material.dart';
import 'package:labasDoctor/dummyData/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:labasDoctor/helper/apimodel.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/shared/theme.dart';

Widget customIcon(
  BuildContext context, {
  int icon,
  bool isEnable = false,
  double size = 18,
  bool istwitterIcon = true,
  bool isFontAwesomeRegular = false,
  bool isFontAwesomeSolid = false,
  Color iconColor,
  double paddingIcon = 10,
}) {
  iconColor = iconColor ?? Theme.of(context).textTheme.caption.color;
  return Padding(
    padding: EdgeInsets.only(bottom: istwitterIcon ? paddingIcon : 0),
    child: Icon(
      IconData(icon,
          fontFamily: istwitterIcon
              ? 'TwitterIcon'
              : isFontAwesomeRegular
                  ? 'AwesomeRegular'
                  : isFontAwesomeSolid
                      ? 'AwesomeSolid'
                      : 'Fontello'),
      size: size,
      color: isEnable ? Theme.of(context).primaryColor : iconColor,
    ),
  );
}

double getDimension(context, double unit) {
  if (fullWidth(context) <= 360.0) {
    return unit / 1.3;
  } else {
    return unit;
  }
}

double fullWidth(BuildContext context) {
  // cprint(MediaQuery.of(context).size.width.toString());
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Widget customInkWell(
    {Widget child,
    BuildContext context,
    Function(bool, int) function1,
    Function onPressed,
    bool isEnable = false,
    int no = 0,
    Color color = Colors.transparent,
    Color splashColor,
    BorderRadius radius}) {
  if (splashColor == null) {
    splashColor = Theme.of(context).primaryColorLight;
  }
  if (radius == null) {
    radius = BorderRadius.circular(0);
  }
  return Material(
    color: color,
    child: InkWell(
      borderRadius: radius,
      onTap: () {
        if (function1 != null) {
          function1(isEnable, no);
        } else if (onPressed != null) {
          onPressed();
        }
      },
      splashColor: splashColor,
      child: child,
    ),
  );
}

Widget customImage(
  BuildContext context,
  String path, {
  double height = 50,
  bool isBorder = false,
}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey.shade100, width: isBorder ? 2 : 0),
    ),
    child: CircleAvatar(
      maxRadius: height / 2,
      backgroundColor: Theme.of(context).cardColor,
      backgroundImage: customAdvanceNetworkImage(path ?? dummyProfilePic),
    ),
  );
}

dynamic customAdvanceNetworkImage(String path) {
  if (path == null) {
    path = dummyProfilePic;
  }
  return CachedNetworkImageProvider(
    path ?? dummyProfilePic,
  );
}

Widget customTitleText(String title, {BuildContext context}) {
  return Text(
    title ?? '',
    style: TextStyle(
      color: Colors.black87,
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w900,
      fontSize: 20,
    ),
  );
}

Widget userHeader({
  String imagePath,
  BuildContext context,
}) {
  return Container(
    margin: const EdgeInsets.only(
      top: 15.0,
      left: 20.0,
      right: 20.0,
      bottom: 20.0,
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 25.0,
          ),
          width: 70.0,
          height: 70.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: User.userData.userResult.image != null
                  ? new CachedNetworkImageProvider(
                      "${API.API_URL}${User.userData.userResult.image}")
                  : AssetImage("asset/images/dummy.png"),
            ),
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: [
                    Text(
                      getTranslated(context, 'WelcomeBack'),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.25,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        titleCase("${User.userData.userResult.name}"),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.25,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: FractionalOffset.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Text(
                    getTranslated(context, 'YourAppointmentsfortoday'),
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

String titleCase(String text) {
  if (text.length <= 1) return text.toUpperCase();
  var words = text.split(' ');
  var capitalized = words.map((word) {
    var first = word.substring(0, 1).toUpperCase();
    var rest = word.substring(1);
    return '$first$rest';
  });
  return capitalized.join(' ');
}

class DateTile extends StatelessWidget {
  final String weekDay;
  final String date;
  final bool isSelected;
  DateTile({this.weekDay, this.date, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFF89b9f0) : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            date,
            style: TextStyle(
                color: isSelected ? LabasColor.white : LabasColor.black,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            weekDay,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

Widget sectionTitle(String title) {
  return Container(
    margin: const EdgeInsets.only(
      top: 20.0,
      left: 20.0,
      right: 20.0,
      bottom: 10.0,
    ),
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customText(String msg,
    {Key key,
    TextStyle style,
    TextAlign textAlign = TextAlign.justify,
    TextOverflow overflow = TextOverflow.visible,
    BuildContext context,
    bool softwrap = true}) {
  if (msg == null) {
    return SizedBox(
      height: 0,
      width: 0,
    );
  } else {
    if (context != null && style != null) {
      var fontSize =
          style.fontSize ?? Theme.of(context).textTheme.body1.fontSize;
      style = style.copyWith(
        fontSize: fontSize - (fullWidth(context) <= 375 ? 2 : 0),
      );
    }
    return Text(
      msg,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softwrap,
      key: key,
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  final bool isChecked;
  final bool visibleSwitch;
  CustomCheckBox({Key key, this.isChecked, this.visibleSwitch})
      : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  ValueNotifier<bool> isChecked = ValueNotifier(false);
  ValueNotifier<bool> visibleSwitch = ValueNotifier(false);
  @override
  void initState() {
    isChecked.value = widget.isChecked;
    visibleSwitch.value = widget.visibleSwitch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isChecked != null
        ? ValueListenableBuilder<bool>(
            valueListenable: isChecked,
            builder: (context, value, child) {
              return Checkbox(
                value: value,
                onChanged: (val) {
                  isChecked.value = val;
                },
              );
            },
          )
        : widget.visibleSwitch == null
            ? SizedBox(
                height: 10,
                width: 10,
              )
            : ValueListenableBuilder(
                valueListenable: visibleSwitch,
                builder: (context, value, child) {
                  return Switch(
                    onChanged: (val) {
                      visibleSwitch.value = val;
                    },
                    value: value,
                  );
                },
              );
  }
}

class HeaderWidget extends StatelessWidget {
  final String title;
  final bool secondHeader;
  const HeaderWidget(this.title, {Key key, this.secondHeader = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: secondHeader
          ? EdgeInsets.only(left: 18, right: 18, bottom: 10, top: 10)
          : EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      color: LabasColor.mystic,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(
                fontSize: 20,
                color: AppColor.darkGrey,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
