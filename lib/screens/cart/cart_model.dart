import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
  });
}

class Cart {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  // Add an Item to Cart
  void addItem(String productId, String name, double price) {
    // Check if Item is already in Cart
    if (_items.containsKey(productId)) {
      // Increment the Item Quantity
      _items.update(
          productId,
          (existingItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingItem.name,
              quantity: existingItem.quantity + 1,
              price: existingItem.price));
    } else {
      // Add the item to Cart
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              name: name,
              quantity: 1,
              price: price));
    }
  }

  // Remove an Product from the cart
  void removeItem(String productId) {
    _items.remove(productId);
  }

  // Remove a Single Item
  void removeSingleItem(String productId) {
    // Check if Item Exists
    if (!_items.containsKey(productId)) {
      return;
    }

    // Remove a single item from the cart
    _items.update(
        productId,
        (existingItem) => CartItem(
            id: DateTime.now().toString(),
            name: existingItem.name,
            quantity: existingItem.quantity - 1,
            price: existingItem.price));
  }

  double get totalAmount {
    var total = 0.0;

    _items.forEach((productId, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
