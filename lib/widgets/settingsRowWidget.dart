import 'package:flutter/material.dart';
import 'package:labasDoctor/shared/theme.dart';

import 'customWidgets.dart';

class SettingRowWidget extends StatelessWidget {
  const SettingRowWidget(
    this.title, {
    Key key,
    this.navigateTo,
    this.subtitle,
    this.textColor = Colors.black,
    this.onPressed,
    this.vPadding = 0,
    this.showDivider = true,
    this.visibleSwitch,
    this.showCheckBox,
  }) : super(key: key);
  final bool visibleSwitch, showDivider, showCheckBox;
  final String navigateTo;
  final String subtitle, title;
  final Color textColor;
  final Function onPressed;
  final double vPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: vPadding, horizontal: 18),
            onTap: () {
              if (onPressed != null) {
                onPressed();
                return;
              }
              if (navigateTo == null) {
                return;
              }
              Navigator.pushNamed(context, '/$navigateTo');
            },
            title: title == null
                ? null
                : Text(
                    title ?? '',
                    style: TextStyle(fontSize: 16, color: textColor),
                  ),
            subtitle: subtitle == null
                ? null
                : Text(
                    subtitle,
                    style: TextStyle(
                        color: LabasColor.paleSky, fontWeight: FontWeight.w400),
                  ),
            trailing: CustomCheckBox(
              isChecked: showCheckBox,
              visibleSwitch: visibleSwitch,
            )),
        !showDivider ? SizedBox() : Divider(height: 0)
      ],
    );
  }
}
