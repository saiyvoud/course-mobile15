import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:shopgood/models/banner_model.dart';
import 'package:shopgood/service/banner_service.dart';

class BannerProvider extends ChangeNotifier {
  List<BannerModel> _banners = [];
  bool _loading = false;
  final bannerService = BannerService();
  List<BannerModel>? get banners => _banners;
  get loading => _loading;

  Future<void> getAllBanner() async {
    _loading = true;
    try {
      final result = await bannerService.getAllBanner();

      if (result!.length > 0) {
        _banners = result;
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;  
      notifyListeners();
    }
  }
}
