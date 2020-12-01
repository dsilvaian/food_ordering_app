import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_ordering_app/constraints.dart';
import 'package:food_ordering_app/services/cart_service.dart';
import 'package:food_ordering_app/screens/details/components/order-button.dart';
import 'package:food_ordering_app/screens/details/components/title-price-rating.dart';
import 'package:provider/provider.dart';

class ItemInfo extends StatelessWidget {
  final Map item;
  const ItemInfo({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          shopName(name: item["Shop"]),
          TitlePriceRating(
            name: item["Item"],
            numberOfReviews: 24,
            rating: 4,
            price: item["Price"],
            onRatingChange: (value) {},
          ),
          Text(
            item["Description"],
            // "But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who.",
            // "But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure.",
            style: TextStyle(height: 1.3),
          ),
          OrderButton(press: () {
            cart.addItem(item["productId"], item["Item"], item["Price"]);
          }),
        ],
      ),
    );
  }

  Row shopName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}
