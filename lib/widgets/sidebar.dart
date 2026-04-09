import 'package:flutter/material.dart';
import 'package:labasDoctor/dummyData/constants.dart';
import 'package:labasDoctor/helper/apimodel.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/screens/loginScreen.dart';
import 'package:labasDoctor/screens/middlePageScreen.dart';
import 'package:labasDoctor/screens/patienthistory.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:labasDoctor/shared/utils.dart';
import 'package:labasDoctor/utils/routes.dart';
import 'package:labasDoctor/widgets/settingsRowWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_modal_sheet.dart';
import 'customWidgets.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  _SidebarMenuState createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  Widget _menuHeader() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.only(left: 17, top: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(28),
              image: DecorationImage(
                image: User.userData.userResult.image != null
                    ? customAdvanceNetworkImage(
                        "${API.API_URL}${User.userData.userResult.image}",
                      )
                    : AssetImage("assets/images.dummy.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            title: Row(
              children: <Widget>[
                Text(
                  "${User.userData.userResult.name}",
                  style: onPrimaryTitleText.copyWith(
                      color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  width: 3,
                ),
                customIcon(context,
                    icon: AppIcon.blueTick,
                    istwitterIcon: true,
                    iconColor: AppColor.primary,
                    size: 18,
                    paddingIcon: 3)
              ],
            ),
            subtitle: customText(
              "${User.userData.userResult.mobile}",
              style: onPrimarySubTitleText.copyWith(
                  color: Colors.black54, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  ListTile _menuListRowButton(String title,
      {Function onPressed, int icon, bool isEnable = false}) {
    return ListTile(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      leading: icon == null
          ? null
          : Padding(
              padding: EdgeInsets.only(top: 5),
              child: customIcon(
                context,
                icon: icon,
                size: 25,
                iconColor: isEnable ? AppColor.darkGrey : AppColor.lightGrey,
              ),
            ),
      title: customText(
        title,
        style: TextStyle(
          fontSize: 20,
          color: isEnable ? AppColor.secondary : AppColor.lightGrey,
        ),
      ),
    );
  }

  Positioned _footer() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: <Widget>[
          Divider(height: 0),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
                height: 45,
              ),
              customIcon(context,
                  icon: AppIcon.bulbOn,
                  istwitterIcon: true,
                  size: 25,
                  iconColor: LabasColor.dodgetBlue),
              Spacer(),
              Image.asset(
                'assets/images/logo/appIcon.png',
                height: 35,
              ),
              SizedBox(
                width: 10,
                height: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateTo(String path) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed('/$path');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    child: _menuHeader(),
                  ),
                  Divider(),
                  _menuListRowButton(getTranslated(context, 'Profile'),
                      icon: AppIcon.profile, isEnable: true, onPressed: () {
                    _navigateTo('ProfilePage');
                  }),
                  // _menuListRowButton(
                  //     getTranslated(context, 'AppointmentsSmall'),
                  //     icon: AppIcon.lists,
                  //     isEnable: true, onPressed: () {
                  //   _navigateTo('Calender');
                  // }),
                  // _menuListRowButton(getTranslated(context, 'Records'),
                  //     icon: AppIcon.bookmark),
                  // _menuListRowButton(getTranslated(context, 'Hospitals'),
                  //     icon: AppIcon.heartEmpty),
                  // Divider(),
                  // _menuListRowButton(
                  //     getTranslated(context, 'Settingsandprivacy'),
                  //     isEnable: true, onPressed: () {
                  //   _navigateTo('SettingsAndPrivacyPage');
                  // }),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.book_online_outlined),
                    title: Text(getTranslated(context, 'Appointments')),
                    onTap: () {
                      AppRoutes.push(context, PatientHistory());
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text(
                      getTranslated(context, 'changeLanguage') ??
                          'Change Language',
                    ),
                    onTap: () {
                      bottomModalSheet(context);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(getTranslated(context, 'Logout')),
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      AppRoutes.replace(context, LoginScreen());
                    },
                  ),
                ],
              ),
            ),
            _footer()
          ],
        ),
      ),
    );
  }
}
