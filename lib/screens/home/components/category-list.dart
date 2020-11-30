import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home/components/item-list.dart';
import 'category-items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryListState();
  }
}

class _CategoryListState extends State<CategoryList> {
  int selected = 1;
  List categoryItemsList;

  @override
  void initState() {
    super.initState();
    clickCategory(s: selected);
  }

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
                    clickCategory(s: 1);
                  });
                },
              ),
              CategoryItem(
                title: "Non Veg",
                isActive: selected == 2 ? true : false,
                press: () {
                  setState(() {
                    selected = 2;
                    clickCategory(s: 2);
                  });
                },
              ),
              CategoryItem(
                title: "Veg",
                isActive: selected == 3 ? true : false,
                press: () {
                  setState(() {
                    selected = 3;
                    clickCategory(s: 3);
                  });
                },
              ),
              CategoryItem(
                title: "Snacks & Sides",
                isActive: selected == 4 ? true : false,
                press: () {
                  setState(() {
                    selected = 4;
                    clickCategory(s: 4);
                  });
                },
              ),
              CategoryItem(
                title: "Beverages",
                isActive: selected == 5 ? true : false,
                press: () {
                  setState(() {
                    selected = 5;
                    clickCategory(s: 5);
                  });
                },
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: getItemDetails(selected),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  ItemList(items: categoryItemsList),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Future<List> getItemDetails(selected) async {
    String category = "";
    if (selected == 1) {
      category = "Combo-Meal";
    } else if (selected == 2) {
      category = "Non-Veg";
    } else if (selected == 3) {
      category = "Veg";
    } else if (selected == 4) {
      category = "Snacks";
    } else if (selected == 5) {
      category = "Beverage";
    }
    List items = [];
    await FirebaseFirestore.instance
        .collection('Items')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                if (doc.data()["Category"] == category) {
                  var data = doc.data();
                  data["productId"] = doc.id;
                  items.add(data);
                }
              })
            });
    return items;
  }

  void clickCategory({int s}) async {
    final i = await getItemDetails(selected);
    setState(() {
      selected = s;
      categoryItemsList = i;
    });
  }
}
