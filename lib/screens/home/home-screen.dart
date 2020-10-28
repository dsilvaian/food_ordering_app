import 'package:flutter/material.dart';
import 'components/app-bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
    );
  }
}
