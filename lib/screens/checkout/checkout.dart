import 'package:flutter/material.dart';

import 'package:geocoder/geocoder.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/cart_service.dart';
import '../../services/order_service.dart';
import '../../services/notification_service.dart';

import '../cart/components/cart_total.dart';
import './components/place_order_button.dart';
import './components/address_form.dart';
import '../../components/sidebar/sidebar_layout.dart';

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
    final cart = Provider.of<Cart>(context);
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
        child: SingleChildScrollView(
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
              TotalCalculationWidget(
                displayItems: false,
              ),
              PlaceOrderButton(
                press: () async {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  User user = context.read<User>();
                  String orderId = await order.placeOrder(
                    user.uid,
                    cart.items.values.toList(),
                    cart.totalAmount,
                  );

                  cart.clear();

                  final notifP = context.read<NotificationService>();
                  notifP.sendNotification(
                    "Order Placed",
                    "Your Order #$orderId has been placed.",
                    "$orderId",
                  );

                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return SideBarLayout();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
