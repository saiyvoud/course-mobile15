import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shopgood/components/api_path.dart';
import 'package:hive/hive.dart';
import 'package:shopgood/components/hive_database.dart';

class AuthService {
  final dio = new Dio();

  Future<bool> validateToken() async {
    try {
      final result = await HiveDatabase.getToken();
      if (result == null || result['token'].toString().isEmpty) {
        return false;
      }
      print(result);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<dynamic> refreshToken() async {}
  Future<dynamic> Login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final data = {
        "phoneNumber": phoneNumber,
        "password": password,
      };
      final response = await dio.post(
        APIPath.login,
        data: data,
      );
      if (response.statusCode == 200) {
        await HiveDatabase.saveToken(
          token: response.data['data']['token'],
          refresh: response.data['data']['refreshToken'],
        );
        await HiveDatabase.saveProfile(
          profile: jsonEncode(response.data['data']),
        );
        return response.data['data'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }

  Future<dynamic> Register(
      {required String phoneNumber,
      required String password,
      required String firstname,
      required String lastname}) async {
    try {
      final data = {
        "firstName": firstname,
        "lastName": lastname,
        "phoneNumber": phoneNumber,
        "password": password,
      };
      final response = await dio.post(
        APIPath.register,
        data: data,
      );
      print(response.data);
      if (response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }
}
