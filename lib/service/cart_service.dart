import 'dart:io';

import 'package:shopgood/components/hive_database.dart';

class CartService {
  Future<List<dynamic>?> getCarts ()async{
    try {
      final result = await HiveDatabase.getCart();
      if(result!.length >0){
        return result;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
  Future<bool?> addQtyCart({
    required int qty
  })async{
    try {
      final result = await HiveDatabase.addQtyCart(qty: qty);
      if(result !=null){
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
  Future<bool?> addNewCart({
    required String productId,
    required String name,
    required String detail,
    required int qty,
    required int price,
    required String image,
  }) async {
    try {
      final result = await HiveDatabase.addNewCart(
        productId: productId,
        name: name,
        detail: detail,
        qty: qty,
        price: price,
        image: image,
      );
      if(result !=null){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
