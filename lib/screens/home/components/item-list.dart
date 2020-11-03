import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/details/details-screen.dart';
import 'item-card.dart';

class ItemList extends StatelessWidget {
  final List items;
  const ItemList({
    Key key,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: getItemCards(items: items, context: context),
      // child: Row(
      // children: <Widget>[
      // ItemCard(
      //   title: "Burger & Beer",
      //   shopName: "McDonald's",
      //   svgSrc: "assets/icons/burger_beer.svg",
      //   press: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) {
      //           return DetailsScreen();
      //         },
      //       ),
      //     );
      //   },
      // ),
      // ItemCard(
      //   title: "Chinese & Noodles",
      //   shopName: "Wendy's",
      //   svgSrc: "assets/icons/chinese_noodles.svg",
      //   press: () {},
      // ),
      // ItemCard(
      //   title: "Burger & Beer",
      //   shopName: "McDonald's",
      //   svgSrc: "assets/icons/burger_beer.svg",
      //   press: () {},
      // ),
      // ],
      // ),
    );
  }

  Widget getItemCards({List items, BuildContext context}) {
    return new Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: items
            .map((item) => new ItemCard(
                  title: item["Item"],
                  shopName: item["Shop"],
                  svgSrc: "assets/icons/chinese_noodles.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(item: item);
                        },
                      ),
                    );
                  },
                ))
            .toList());
  }
}
