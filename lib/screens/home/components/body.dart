import 'package:flutter/material.dart';
import 'package:food_ordering_app/components/search_box.dart';
import 'package:food_ordering_app/screens/home/components/category-list.dart';
import 'package:food_ordering_app/screens/home/components/item-list.dart';
import 'package:food_ordering_app/screens/home/components/discount-card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SearchWidget(
          onChanged: (value) {},
        ),
        CategoryList(),
        ItemList(),
        DiscountCard(),
      ],
    );
  }
}
