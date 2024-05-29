import 'package:flutter/material.dart';
import 'package:shopgood/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _products = [];
  List<dynamic> _product = [];
  final productService = ProductService();
  bool get loading => _loading;
  List<dynamic> get products => _products;
  List<dynamic> get product => _product;
  Future<void> getProductAll() async {
    _loading = true;
    try {
      final result = await productService.getProductAll();
      if (result!.length > 0) {
        _products = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getProductByCategory({
    required String categiryId,
  }) async {
    _loading = true;
    try {
      final result =
          await productService.getProductByCategory(categiryId: categiryId);
      if (result!.length > 0) {
        _products = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
