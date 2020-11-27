import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constraints.dart';
import 'package:food_ordering_app/screens/cart/cart_model.dart';
import 'package:food_ordering_app/screens/cart/components/cart_product.dart';
import 'package:food_ordering_app/screens/cart/components/cart_promo.dart';
import 'package:food_ordering_app/screens/cart/components/cart_total.dart';
import 'package:food_ordering_app/screens/cart/components/cart_checkout_button.dart';
import 'package:provider/provider.dart';

class CartPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final cart = Provider.of<Cart>(context);

    Widget child;

    if (cart.items.isEmpty) {
      child = Container(
        child: Center(
            child: FractionallySizedBox(
          widthFactor: 0.7,
          child: SvgPicture.asset(
            "assets/icons/empty_cart.svg",
          ),
        )),
      );
    } else {
      child = SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
              CartCheckoutButton(press: () {})
            ],
          ),
        ),
      );
    }

    return child;
  }
}