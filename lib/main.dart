import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'constraints.dart';

import 'services/cart_service.dart';
import 'services/auth_service.dart';
import 'services/order_service.dart';

import 'screens/auth/login_page.dart';
import 'screens/cart/cart-screen.dart';
import 'screens/home/home-screen.dart';
import 'components/sidebar/sidebar_layout.dart';

// import 'package:food_ordering_app/screens/home/home-screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(
              FirebaseAuth.instance,
              GoogleSignIn(),
            ),
          ),
          StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges,
          ),
          ChangeNotifierProvider.value(value: Cart()),
          ChangeNotifierProvider.value(value: Order()),
        ],
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
