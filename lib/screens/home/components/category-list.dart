import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home/components/item-list.dart';
import 'category-items.dart';

class CategoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryListState();
  }
}

class _CategoryListState extends State<CategoryList> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CategoryItem(
                title: "Combo Meal",
                isActive: selected == 1 ? true : false,
                press: () {
                  setState(() {
                    selected = 1;
                  });
                },
              ),
              CategoryItem(
                title: "Non Veg",
                isActive: selected == 2 ? true : false,
                press: () {
                  setState(() {
                    selected = 2;
                  });
                },
              ),
              CategoryItem(
                title: "Veg",
                isActive: selected == 3 ? true : false,
                press: () {
                  setState(() {
                    selected = 3;
                  });
                },
              ),
              CategoryItem(
                title: "Snacks & Sides",
                isActive: selected == 4 ? true : false,
                press: () {
                  setState(() {
                    selected = 4;
                  });
                },
              ),
              CategoryItem(
                title: "Beverages",
                isActive: selected == 5 ? true : false,
                press: () {
                  setState(() {
                    selected = 5;
                  });
                },
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            ItemList(),
          ],
        ),
      ],
    );
  }
}
