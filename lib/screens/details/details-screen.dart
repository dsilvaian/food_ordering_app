import 'package:flutter/material.dart';
import 'package:food_ordering_app/constraints.dart';
import 'package:food_ordering_app/screens/details/components/app-bar.dart';
import 'package:food_ordering_app/screens/details/components/item-image.dart';
import 'package:food_ordering_app/screens/details/components/item-info.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context: context),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Enable potrait mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc: "assets/images/burger.png",
        ),
        Expanded(
          child: ItemInfo(),
        ),
      ],
    );
  }
}
