import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/constraints.dart';
import 'package:provider/provider.dart';

import '../cart_model.dart';

class CartProduct extends StatelessWidget {
  final String productId;
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartProduct(this.id, this.productId, this.name, this.quantity, this.price);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                        child: SvgPicture.asset(
                      "assets/icons/chinese_noodles.svg",
                      width: 50,
                      height: 50,
                    )),
                  ),
                ),
                SizedBox(width: 50),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "$name",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF3a3a3b),
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "\$$price",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF3a3a3b),
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    cart.removeItem(productId);
                                  },
                                ))
                          ],
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 20),
                          // alignment: Alignment.centerRight,
                          child: AddToCartMenu(productId, quantity),
                        )
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}

class AddToCartMenu extends StatelessWidget {
  final int productCounter;
  final String productId;

  AddToCartMenu(this.productId, this.productCounter);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              cart.removeSingleItem(productId);
            },
            icon: Icon(Icons.remove),
            color: Colors.black,
            iconSize: 18,
          ),
          InkWell(
            onTap: () => print('hello'),
            child: Container(
              width: 100.0,
              height: 35.0,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  'In Cart: $productCounter',
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              cart.addSingleItem(productId);
            },
            icon: Icon(Icons.add),
            color: kPrimaryColor,
            iconSize: 18,
          ),
        ],
      ),
    );
  }
}
