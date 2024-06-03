import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopgood/service/cart_service.dart';

class CartProvider extends ChangeNotifier {
  bool _loading = false;
  final cartService = CartService();
  List<dynamic> _carts = [];
  bool get loading => _loading;
  List<dynamic> get carts => _carts;
  
  Future<void> getCarts() async {
    _loading = true;
    try {
      final result = await cartService.getCarts();
      if (result!.length > 0) {
        _loading = false;
        _carts = result;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addQtyCart({
    required int qty,
  }) async {
    _loading = false;
    try {
      final result = await cartService.addQtyCart(qty: qty);
      if (result != null) {
        _loading = false;

        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addNewCart({
    required String productId,
    required String name,
    required String detail,
    required int qty,
    required int price,
    required String image,
  }) async {
    _loading = true;
    try {
      final result = await cartService.addNewCart(
        productId: productId,
        name: name,
        detail: detail,
        qty: qty,
        price: price,
        image: image,
      );
      if (result != null) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
      rethrow;
    }
  }
}
