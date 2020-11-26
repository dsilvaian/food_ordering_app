import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_model.dart';

class TotalCalculationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    final totalPrice = cart.totalAmount;

    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        ListView.builder(
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
            }),
        ListTile(
          title: Text("Total"),
          trailing: Text(
            "\$$totalPrice",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ));
  }
}
