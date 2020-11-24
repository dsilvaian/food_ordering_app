import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/components/search-items.dart';
import 'package:food_ordering_app/components/search_box.dart';
import 'package:food_ordering_app/screens/home/components/category-list.dart';
import 'package:food_ordering_app/screens/home/components/discount-card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<FoodItems> items;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FutureBuilder(
          future: getItemDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  SearchBox(snapshot.data),
                  CategoryList(),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        DiscountCard(),
      ],
    );
  }

  Future<List> getItemDetails() async {
    List<FoodItems> items = [];
    await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection('Items')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                items.add(FoodItems(doc.data()));
              })
            });
    return items;
  }
}
