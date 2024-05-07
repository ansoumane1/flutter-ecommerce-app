import 'dart:core';

import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // product for sale
  final List<Product> _shop = [
    Product(name: "Iphone X", price: 1099, description: "item description"),
    Product(name: "Television", price: 1000, description: "item description"),
    Product(name: "Mac Book", price: 9999, description: "item description"),
    Product(name: "Samusung", price: 9999, description: "item description"),
  ];

  // user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> getAllProduct() {
    return _shop;
  }

  // get user cart
  List<Product> getUserCart() {
    return _cart;
  }

  // add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // remove item fro cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
