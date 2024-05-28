import 'dart:convert';

import 'package:shopgood/models/banner_model.dart';
import 'package:dio/dio.dart';

import '../components/api_path.dart';

class BannerService {
  final dio = new Dio();
  Future<List<BannerModel>?> getAllBanner() async {
    try {
      final response = await dio.get(
        APIPath.getAllBanner,
      );
    
      if (response.data['status'] == true) {
        final banner =  bannerModelFromJson(jsonEncode(response.data['data']));
          //print(banner.length);
        return banner;
      }
    } catch (e) {
      rethrow; // return + print
    }
    return null;
  }
}
