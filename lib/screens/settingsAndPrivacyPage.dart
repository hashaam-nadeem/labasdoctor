import 'package:flutter/material.dart';
import 'package:labasDoctor/language/language_constants.dart';
import 'package:labasDoctor/models/UserModel.dart';
import 'package:labasDoctor/shared/theme.dart';
import 'package:labasDoctor/widgets/bottom_modal_sheet.dart';
import 'package:labasDoctor/widgets/customAppBar.dart';
import 'package:labasDoctor/widgets/customWidgets.dart';
import 'package:labasDoctor/widgets/settingsRowWidget.dart';

class SettingsAndPrivacyPage extends StatelessWidget {
  const SettingsAndPrivacyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LabasColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          getTranslated(context, "Settingsandprivacy"),
        ),
      ),
      body: ListView(
        children: <Widget>[
          HeaderWidget('${User.userData.userResult.name}'),
          Divider(height: 0),
          SettingRowWidget(
            getTranslated(context, "PrivacyandPolicy"),
          ),
          SettingRowWidget(
            getTranslated(context, "Contentprefrences"),
          ),
          HeaderWidget(
            getTranslated(context, "General"),
            secondHeader: true,
          ),
          SettingRowWidget(
            getTranslated(context, "AboutLabas"),
          ),
        ],
      ),
    );
  }
}
