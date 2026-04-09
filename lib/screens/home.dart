import 'package:flutter/material.dart';

import 'package:labasDoctor/state/appState.dart';
import 'package:labasDoctor/widgets/bottomMenuBar/bottomMenuBar.dart';

import 'package:labasDoctor/widgets/sidebar.dart';
import 'package:provider/provider.dart';

import 'homePageScreen.dart';
import 'middlePageScreen.dart';
import 'notificationsPage.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  int pageIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var state = Provider.of<AppState>(context, listen: false);
      state.setpageIndex = 0;
    });

    super.initState();
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        child: _getPage(Provider.of<AppState>(context).pageIndex),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePageScreen(
          scaffoldKey: _scaffoldKey,
          refreshIndicatorKey: refreshIndicatorKey,
        );
        break;
      case 1:
        return NotificationPage(scaffoldKey: _scaffoldKey);
        break;
      case 2:
        return MiddlePage(scaffoldKey: _scaffoldKey);
        break;

      default:
        return HomePageScreen(scaffoldKey: _scaffoldKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomMenubar(),
      drawer: SidebarMenu(),
      body: _body(),
    );
  }
}
