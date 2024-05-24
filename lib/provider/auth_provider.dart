import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:shopgood/components/messageHepler.dart';
import 'package:shopgood/router/route.dart';
import 'package:shopgood/service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  dynamic _userData;
  bool _loading = false;
  bool _success = false;

  AuthService authService = AuthService();
  dynamic get userData => _userData;
  bool get loading => _loading;
  bool get success => _success;

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
      navService.goBack();
      if (result != null) {
        _userData = result;
        _loading = false;
         MessageHepler.showSnackBarMessage(
          isSuccess: true, message: "ເຂົ້າສູ່ລະບົບສຳເລັດ");
        navService.pushNamedAndRemoveUntil(RouteAPI.home);
        notifyListeners();
      }
    } catch (e) {
      navService.goBack();
      MessageHepler.showSnackBarMessage(
          isSuccess: false, message: "ເບີໂທ ແລະ ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ");
     
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> validateToken() async {
    final result = await authService.validateToken();
    if (result == true) {
      navService.pushNamedAndRemoveUntil(RouteAPI.home);
    } else {
      refreshToken();
    }
  }

  Future<void> exitApp() async {
    final result = await authService.exitApp();
    if (result == true) {
      navService.pushNamedAndRemoveUntil(RouteAPI.login);
    }
  }

  Future<void> refreshToken() async {
    final result = await authService.refreshToken();
    if (result == true) {
      navService.pushNamedAndRemoveUntil(RouteAPI.home);
    } else {
      navService.pushNamedAndRemoveUntil(RouteAPI.login);
    }
  }

  Future<void> Register({
    required String phoneNumber,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    _loading = true;

    try {
      final result = await authService.Register(
        phoneNumber: phoneNumber,
        password: password,
        firstname: firstname,
        lastname: lastname,
      );
      navService.goBack();
      if (result != null) {
        _loading = false;
        MessageHepler.showSnackBarMessage(
          isSuccess: true, message: "ລົງທະບຽນສຳເລັດ");
        navService.pushNamedAndRemoveUntil(RouteAPI.login);
        notifyListeners();
      }
    } catch (e) {
     
      navService.goBack();
        MessageHepler.showSnackBarMessage(
          isSuccess: false, message: "ລົງທະບຽນບໍ່ສຳເລັດ");
      _loading = false;
      notifyListeners();
    }
  }
}
