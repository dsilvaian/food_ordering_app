import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constraints.dart';
import 'package:food_ordering_app/screens/cart/cart-screen.dart';

PreferredSize homeAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(120),
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: RichText(
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
            ),
            actions: <Widget>[
              // IconButton(
              //   icon: SvgPicture.asset("assets/icons/notification.svg"),
              //   onPressed: () {},
              // ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
