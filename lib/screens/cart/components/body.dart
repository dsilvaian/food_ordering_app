import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_app/constraints.dart';
import 'package:food_ordering_app/screens/cart/cart_model.dart';
import 'package:food_ordering_app/screens/cart/components/cart_product.dart';
import 'package:food_ordering_app/screens/cart/components/cart_promo.dart';
import 'package:food_ordering_app/screens/cart/components/cart_total.dart';
import 'package:provider/provider.dart';

class CartPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final cart = Provider.of<Cart>(context);

    return SingleChildScrollView(
      child: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Your Food Cart",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF3a3a3b),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // CartProduct("123", "burger1", "Burger", 1, 2),
            // CartProduct("123", "burger1", "Burger Noodels", 50, 3),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: cart.items.length,
            //       itemBuilder: (context, index) {
            //         String key = cart.items.keys.elementAt(index);
            //         CartItem _item = cart.items[key];
            //         return CartProduct(
            //             _item.id, key, _item.name, _item.quantity, _item.price);
            //       }),
            // ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  String key = cart.items.keys.elementAt(index);
                  CartItem _item = cart.items[key];
                  return CartProduct(
                      _item.id, key, _item.name, _item.quantity, _item.price);
                }),
            SizedBox(
              height: 10,
            ),
            PromoCodeWidget(),
            SizedBox(height: 10),
            TotalCalculationWidget(),
            FlatButton(
                color: kPrimaryColor,
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

// class CartPageBody extends StatefulWidget {
//   @override
//   _CartPageBodyState createState() => _CartPageBodyState();
// }

// class _CartPageBodyState extends State<CartPageBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
