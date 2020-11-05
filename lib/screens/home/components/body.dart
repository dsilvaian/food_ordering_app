import 'package:flutter/material.dart';
// import 'package:food_ordering_app/components/search_box.dart';
import 'package:food_ordering_app/screens/home/components/category-list.dart';
// import 'package:food_ordering_app/screens/home/components/item-list.dart';
import 'package:food_ordering_app/screens/home/components/discount-card.dart';
import 'package:search_widget/search_widget.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // SearchWidget(
        //   onChanged: (value) {},
        // ),
        SearchBox(data: data),
        CategoryList(),
        // ItemList(),
        DiscountCard(),
      ],
    );
  }
}
