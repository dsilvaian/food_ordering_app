import 'package:flutter/material.dart';
import 'components/app-bar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Body(),
    );
  }
}
