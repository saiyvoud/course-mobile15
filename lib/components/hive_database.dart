import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  static BoxCollection? box;
  Future<BoxCollection?> hiveDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    box = await BoxCollection.open(
      'SHOPGOOD', // Name of your database
      {
        'auth',
      }, // Names of your boxes
      path: directory.path,
    );
    return box;
  }

  static Future<bool?> deleteCartID({required int id}) async {
    try {
      print("=====>Okkkk");
      final myBox = await Hive.box<Map>("cart");
      myBox.deleteAt(id);
      final result = await myBox.values.toList();
      print(result);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool?> deleteCartAll() async {
    try {
      await Hive.box<Map>("cart").clear();

      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<dynamic>?> getCart() async {
    try {
      final myBox = await Hive.openBox<Map>('cart');
      final data = await myBox.values.toList();
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<bool?> addNewCart({
    required String productId,
    required String name,
    required String detail,
    required int qty,
    required int price,
    required String image,
  }) async {
    final myBox = await Hive.openBox<Map>('cart');

    await myBox.add({
      "productId": productId,
      "name": name,
      "detail": detail,
      "qty": qty,
      "price": price,
      "image": image,
    });
    await myBox.values.toList();

    return true;
  }

  static Future<bool?> addQtyCart({
    required int qty,
  }) async {
    final myBox = await Hive.openBox<Map>('cart');

    await myBox.put("cart", {
      "qty": qty,
    });
    await myBox.values.toList();

    return true;
  }

  static Future<dynamic> getProfile() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['profile']);
    final respone = jsonDecode(data[0]!['data']);
    return respone;
  }

  static Future<dynamic> getToken() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['tokens']);
    return data[0];
  }

  static Future<dynamic> getUserId() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.get("user_id");
    final userId = jsonDecode(data!['data']);

    return userId;
  }

  static Future<bool> saveProfile({
    required String profile,
  }) async {
    final userBox = await box!.openBox<Map>('auth');
    await userBox.put("profile", {
      "data": profile,
    });
    return true;
  }

  static Future<bool> saveToken({
    required String token,
    required String refresh,
  }) async {
    final userBox = await box!.openBox<Map>('auth');

    await userBox.put("tokens", {
      "accessToken": token,
      "refreshToken": refresh,
    });
    return true;
  }

  static Future<bool> saveUserId({
    required String user_id,
  }) async {
    final userBox = await box!.openBox<Map>('auth');
    await userBox.put("user_id", {
      "data": user_id,
    });
    return true;
  }

  static Future<bool> deleteProfile() async {
    final userBox = await box!.openBox<Map>('auth');
    await userBox.deleteAll(['profile']);

    return true;
  }

  static Future<bool> deleteToken() async {
    final userBox = await box!.openBox<Map>('auth');
    await userBox.deleteAll(['tokens']);

    return true;
  }

  static Future<bool> deleteUserId() async {
    final userBox = await box!.openBox<Map>('auth');
    await userBox.deleteAll(['user_id']);

    return true;
  }
}
