import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/services/cart_service.dart';
import 'package:food_ordering_app/services/auth_service.dart';
import 'package:geocoder/geocoder.dart';
import 'package:uuid/uuid.dart';

import 'package:location/location.dart';

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

    // Map<String, dynamic> orderData = {
    //   "userId": userId,
    //   "orderId": orderId,
    //   "dateTime": dateTime.toIso8601String(),
    //   "orderItems": cart
    //       .map((cartItem) => {
    //             "foodItemId": cartItem.id,
    //             "foodItemName": cartItem.name,
    //             "quantity": cartItem.quantity.toString(),
    //             "price": cartItem.price.toString(),
    //           })
    //       .toList(),
    //   "totalAmount": totalAmount,
    // };

    Map<String, dynamic> orderData = {
      "userId": userId,
      "orderId": orderId,
      "dateTime": dateTime.toIso8601String(),
      "orderItems": cart.map((cartItem) => cartItem.toJson()).toList(),
      "totalAmount": totalAmount,
    };

    String message;

    // print(orderData);

    await FirebaseFirestore.instance
        .collection('Orders')
        .add(orderData)
        .then((value) => {
              this._orders.putIfAbsent(
                  value.id,
                  () => OrderItem(
                        userId,
                        orderId,
                        cart,
                        dateTime,
                      )),
              message = value.id
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

  Future<LocationData> getLocationCoords() async {
    Location _location = Location();

    bool _isLocServiceEnabled;
    PermissionStatus _locPermissionGranted;

    // Check if Location Service is Enabled
    _isLocServiceEnabled = await _location.serviceEnabled();

    if (!_isLocServiceEnabled) {
      _isLocServiceEnabled = await _location.requestService();

      if (!_isLocServiceEnabled) {
        return null;
      }
    }

    // Check if location Permission is Granted by the user
    _locPermissionGranted = await _location.hasPermission();

    if (_locPermissionGranted == PermissionStatus.denied) {
      _locPermissionGranted = await _location.requestPermission();

      if (_locPermissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    // Get Location Co-ordinates
    final coords = await _location.getLocation();
    return coords;
  }

  Future<Address> getAddress(Coordinates coords) async {
    final address = await Geocoder.local.findAddressesFromCoordinates(coords);
    return address.first;
  }

  Future<Address> getLocationAddress() async {
    LocationData coords = await getLocationCoords();
    Address address = await getAddress(Coordinates(
      coords.latitude,
      coords.longitude,
    ));

    print(address.toMap().toString());

    return address;
  }
}
