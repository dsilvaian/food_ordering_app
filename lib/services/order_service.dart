import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/services/cart_service.dart';
import 'package:food_ordering_app/services/auth_service.dart';
import 'package:uuid/uuid.dart';

class OrderItem {
  final String orderId;
  final String userId;
  final List<CartItem> orderItems;
  final DateTime dateTime;

  OrderItem(
    this.userId,
    this.orderId,
    this.orderItems,
    this.dateTime,
  );
}

class Order with ChangeNotifier {
  Map<String, OrderItem> _orders = {};

  Map<String, OrderItem> get orders {
    return {..._orders};
  }

  Future<String> placeOrder(
    String userId,
    List<CartItem> cart,
    double totalAmount,
  ) async {
    var uuid = Uuid();

    String orderId = uuid.v1();
    DateTime dateTime = DateTime.now();

    Map<String, dynamic> orderData = {
      "userId": userId,
      "orderId": orderId,
      "dateTime": dateTime.toIso8601String(),
      "orderItems": cart
          .map((cartItem) => {
                "foodItemId": cartItem.id,
                "foodItemName": cartItem.name,
                "quantity": cartItem.quantity.toString(),
                "price": cartItem.price.toString(),
              })
          .toList(),
      "totalAmount": totalAmount,
    };

    String message;

    // print(orderData);

    await FirebaseFirestore.instance
        .collection('Orders')
        .add(orderData)
        .then((value) => {
              this._orders.putIfAbsent(
                  value.toString(),
                  () => OrderItem(
                        userId,
                        orderId,
                        cart,
                        dateTime,
                      )),
              message = "Order Placed"
            });
    notifyListeners();
    return message;
  }

  Future<void> fetchOrders(String userId) async {
    await FirebaseFirestore.instance
        .collection("Orders")
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((doc) {
                if (doc.data()["userId"] == userId) {
                  var data = doc.data();
                  // print(data);

                  List<CartItem> orderItems = [];
                  data["orderItems"].forEach((item) => {
                        orderItems.add(
                          CartItem(
                            id: item["foodItemId"],
                            name: item["foodItemName"],
                            quantity: int.parse(item["quantity"]),
                            price: double.parse(item["price"]),
                          ),
                        ),
                      });

                  this._orders.putIfAbsent(
                      doc.id,
                      () => OrderItem(data["userId"], data["orderId"],
                          orderItems, DateTime.parse(data["dateTime"])));
                }
              })
            });
    notifyListeners();
  }
}
