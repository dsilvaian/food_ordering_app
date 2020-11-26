import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_model.dart';

class TotalCalculationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    final totalPrice = cart.totalAmount;

    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
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
          padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Text(
              //       "Grilled Salmon",
              //       style: TextStyle(
              //           fontSize: 18,
              //           color: Color(0xFF3a3a3b),
              //           fontWeight: FontWeight.w400),
              //       textAlign: TextAlign.left,
              //     ),
              //     Text(
              //       "\$192",
              //       style: TextStyle(
              //           fontSize: 18,
              //           color: Color(0xFF3a3a3b),
              //           fontWeight: FontWeight.w400),
              //       textAlign: TextAlign.left,
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  String key = cart.items.keys.elementAt(index);
                  CartItem _item = cart.items[key];

                  final String unitName = _item.name;
                  final double unitPrice = _item.price * _item.quantity;

                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "$unitName",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF3a3a3b),
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "\$$unitPrice",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF3a3a3b),
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Text(
              //       "Meat vegetable",
              //       style: TextStyle(
              //           fontSize: 18,
              //           color: Color(0xFF3a3a3b),
              //           fontWeight: FontWeight.w400),
              //       textAlign: TextAlign.left,
              //     ),
              //     Text(
              //       "\$102",
              //       style: TextStyle(
              //           fontSize: 18,
              //           color: Color(0xFF3a3a3b),
              //           fontWeight: FontWeight.w400),
              //       textAlign: TextAlign.left,
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "\$$totalPrice",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
