import 'package:flutter/material.dart';
import 'package:food_ordering_app/components/bottom_nav_bar.dart';
import 'package:food_ordering_app/screens/home/components/drawer.dart';
import 'components/app-bar.dart';
import 'components/body.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Enable potrait mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: homeAppBar(context, _scaffoldKey),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
      drawer: homeDrawer(context),
    );
  }
}
