import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:food_ordering_app/constraints.dart';
import 'package:food_ordering_app/screens/cart/cart_model.dart';

import 'package:food_ordering_app/screens/auth/login_page.dart';
import 'package:food_ordering_app/screens/cart/cart-screen.dart';
import 'package:food_ordering_app/screens/home/home-screen.dart';
import 'package:food_ordering_app/components/sidebar/sidebar_layout.dart';

// import 'package:food_ordering_app/screens/home/home-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: Cart())],
        child: MaterialApp(
          title: 'Food App',
          // debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
                bodyText1: TextStyle(color: ksecondaryColor),
                bodyText2: TextStyle(color: ksecondaryColor)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginPage(),
          // home: HomeScreen(),
          // home: SideBarLayout(),
          // home: CartPage(),
        ));
  }
}
