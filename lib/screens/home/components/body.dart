import 'package:flutter/material.dart';
import 'package:food_ordering_app/components/search_box.dart';
import 'category-list.dart';
import 'item-list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchWidget(
          onChanged: (value) {},
        ),
        CategoryList(),
        ItemList(),
      ],
    );
  }
}
