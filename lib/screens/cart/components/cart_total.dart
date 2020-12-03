import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/cart_service.dart';

class TotalCalculationWidget extends StatelessWidget {
  final bool displayItems;

  TotalCalculationWidget({
    Key key,
    this.displayItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    final totalPrice = cart.totalAmount;

    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        displayItems
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  String key = cart.items.keys.elementAt(index);
                  CartItem _item = cart.items[key];

                  final String unitName = _item.name;
                  final double unitPrice = _item.price * _item.quantity;

                  return ListTile(
                    title: Text("$unitName"),
                    trailing: Text("\$$unitPrice"),
                  );
                })
            : SizedBox.shrink(),
        SizedBox(
          height: 10,
        ),
        ListTile(
          title: Text(
            "Delivery",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
          ),
          trailing: Text(
            "\$0",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          title: Text("Total"),
          trailing: Text(
            "\$$totalPrice",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ));
  }
}
