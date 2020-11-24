import 'package:flutter/material.dart';
import 'package:food_ordering_app/constraints.dart';
import 'package:food_ordering_app/screens/auth/login_page.dart';
import 'package:food_ordering_app/screens/auth/sign_in.dart';

Drawer homeDrawer(BuildContext context) {
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Punk Food',
              style: TextStyle(fontSize: 50, color: Colors.white)),
          decoration: BoxDecoration(
            color: Colors.green,
          ),
        ),
        RaisedButton(
          onPressed: () {
            signOutGoogle();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return LoginPage();
            }), ModalRoute.withName('/'));
          },
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Sign Out',
                style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
      ],
    ),
  );
}
