import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constraints.dart';
import 'package:food_ordering_app/screens/cart/cart-screen.dart';

AppBar homeAppBar(BuildContext context, GlobalKey<ScaffoldState> skey) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {
        skey.currentState.openDrawer();
      },
    ),
    title: RichText(
      text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: "punk",
              style: TextStyle(color: ksecondaryColor),
            ),
            TextSpan(
              text: "Food",
              style: TextStyle(color: kPrimaryColor),
            )
          ]),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/notification.svg"),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
      ),
    ],
  );
}
