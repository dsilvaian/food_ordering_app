import 'package:flutter/material.dart';
import 'category-items.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Combo Meal",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: "Non Veg",
            press: () {},
          ),
          CategoryItem(
            title: "Veg",
            press: () {},
          ),
          CategoryItem(
            title: "Snacks & Sides",
            press: () {},
          ),
          CategoryItem(
            title: "Beverages",
            press: () {},
          ),
        ],
      ),
    );
  }
}
