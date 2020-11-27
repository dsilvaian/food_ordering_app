import 'package:flutter/material.dart';

import 'sidebar.dart';
import '../../screens/home/home-screen.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            HomeScreen(),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
