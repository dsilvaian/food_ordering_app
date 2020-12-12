import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/app-bar.dart';
import 'components/body.dart';
import '../../components/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Enable potrait mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      // key: _scaffoldKey,
      appBar: homeAppBar(context),
      // bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
