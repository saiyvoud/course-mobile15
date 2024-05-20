import 'package:dio/dio.dart';
import 'package:shopgood/components/api_path.dart';

class AuthService {
  final dio = new Dio();
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
        return response.data;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }
}
