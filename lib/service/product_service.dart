import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shopgood/components/api_path.dart';

class ProductService {
  final dio = new Dio();
  Future<List<dynamic>?> getProductAll() async {
    try {
      final response = await dio.get(APIPath.getProductAll);
      if (response.data['status'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>?> getProductByCategory({
    required String categiryId,
  }) async {
    try {
      final response = await dio.get(APIPath.getProductByCategory + categiryId);
      if (response.data['status'] == true) {
        return response.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
