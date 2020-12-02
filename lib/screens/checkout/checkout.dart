import 'package:flutter/material.dart';

import 'package:geocoder/geocoder.dart';
import 'package:provider/provider.dart';

import '../../services/order_service.dart';

import '../cart/components/cart_total.dart';
import './components/place_order_button.dart';
import './components/address_form.dart';

// class CheckoutPage extends StatefulWidget {
//   final Address address;
//   const CheckoutPage({Key key, this.address}) : super(key: key);

//   @override
//   _CheckoutPageState createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
class CheckoutPage extends StatelessWidget {
  String name;
  String addressLine;
  String city;
  String pincode;
  String state;

  CheckoutPage(
    this.name,
    this.addressLine,
    this.city,
    this.pincode,
    this.state,
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final order = context.watch<Order>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text("Delivery Address"),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddressForm(
              formKey: _formKey,
              name: name,
              addressLine: addressLine,
              city: city,
              pincode: pincode,
              state: state,
            ),
            TotalCalculationWidget(),
            PlaceOrderButton(
              press: () {
                _formKey.currentState.validate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
