import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/cart/components/app-bar.dart';
import 'package:food_ordering_app/screens/cart/components/body.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppBar(),
      body: CartPageBody(),
    );
  }
}
