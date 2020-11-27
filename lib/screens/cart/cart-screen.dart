import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/cart/components/body.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Food Cart",
          textAlign: TextAlign.center,
        ),
      ),
      body: CartPageBody(),
    );
  }
}
