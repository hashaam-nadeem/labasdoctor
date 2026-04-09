import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labasDoctor/shared/utils.dart';

import 'package:labasDoctor/state/appState.dart';
import 'package:labasDoctor/utils/Colors.dart';
import 'package:labasDoctor/widgets/bottomMenuBar/tabItem.dart';
import 'package:provider/provider.dart';

import '../customWidgets.dart';

class BottomMenubar extends StatefulWidget {
  const BottomMenubar({this.pageController});
  final PageController pageController;
  _BottomMenubarState createState() => _BottomMenubarState();
}

class _BottomMenubarState extends State<BottomMenubar> {
  PageController _pageController;
  int _selectedIcon = 0;
  @override
  void initState() {
    _pageController = widget.pageController;
    super.initState();
  }

  Widget _iconRow() {
    var state = Provider.of<AppState>(
      context,
    );
    return Container(
      height: 50,
      decoration:
          BoxDecoration(color: Theme.of(context).bottomAppBarColor, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, -.1), blurRadius: 0)
      ]),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // _icon(null, 0,
          //     icon: 0 == state.pageIndex ? AppIcon.homeFill : AppIcon.home,
          //     isCustomIcon: true),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIcon = 0;
                state.setpageIndex = 0;
              });
            },
            child: Icon(
              Icons.home,
              color: _selectedIcon == 0 ? mainColor : Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIcon = 1;
                state.setpageIndex = 1;
              });
            },
            child: Icon(
              Icons.timelapse_rounded,
              color: _selectedIcon == 1 ? mainColor : Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIcon = 2;
                state.setpageIndex = 2;
              });
            },
            child: Icon(
              Icons.offline_pin,
              color: _selectedIcon == 2 ? mainColor : Colors.grey,
            ),
          ),
          // _icon(null, 1,
          //     icon: 1 == state.pageIndex
          //         ? AppIcon.messageFill
          //         : AppIcon.messageEmpty,
          //     isCustomIcon: true),
          // _icon(null, 2,
          //     icon: 2 == state.pageIndex ? AppIcon.report : AppIcon.report,
          //     isCustomIcon: true),
        ],
      ),
    );
  }

  Widget _icon(IconData iconData, int index,
      {bool isCustomIcon = false, int icon}) {
    var state = Provider.of<AppState>(
      context,
    );
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedAlign(
          duration: Duration(milliseconds: ANIM_DURATION),
          curve: Curves.easeIn,
          alignment: Alignment(0, ICON_ON),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: ANIM_DURATION),
            opacity: ALPHA_ON,
            child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              padding: EdgeInsets.all(0),
              alignment: Alignment(0, 0),
              icon: isCustomIcon
                  ? customIcon(context,
                      icon: icon,
                      size: 22,
                      istwitterIcon: true,
                      isEnable: index == state.pageIndex)
                  : Icon(
                      iconData,
                      color: index == state.pageIndex
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.caption.color,
                    ),
              onPressed: () {
                setState(() {
                  _selectedIcon = index;
                  state.setpageIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _iconRow();
  }
}
