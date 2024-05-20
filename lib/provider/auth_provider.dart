import 'package:flutter/material.dart';
import 'package:shopgood/service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  dynamic _userData;
  bool _loading = false;

  AuthService authService = AuthService();
  dynamic get userData => _userData;
  bool get loading => _loading;
  Future<void> Login({
    required String phoneNumber,
    required String password,
  }) async {
    _loading = true;
    try {
      final result = await authService.Login(
        phoneNumber: phoneNumber,
        password: password,
      );
      if (result != null) {
        _userData = result;
        _loading = false;
        print("=======>Success");
        notifyListeners();
      }
    } catch (e) {
       print("=======>Faild");
      _loading = false;
    }
  }
}
