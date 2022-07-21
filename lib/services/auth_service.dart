import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ab3ad/models/User.dart';
import 'package:get/get.dart';

import '../utils/.env.dart';

class AuthService extends GetConnect {
  late String token;
  final storage = const FlutterSecureStorage();

  Future login({required Map formData}) async {
    final response = await post(
      authEndPoint,
      formData,
      headers: {"Accept": "application/json"},
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      String token = response.body['data'].toString();
      return await tryToken(token: token);
    }
  }

  Future otpVerification({required Map formData}) async {
    String token = await readToken();
    final response = await post(
      otpEndPoint,
      formData,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return true;
    }
  }

  Future<User> tryToken({required String token}) async {
    final response = await get(fetchAuthUserEndPoint,
        headers: {'Authorization': 'Bearer $token'});
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      await storeToken(token: token);
      return User.fromJson(response.body['data']);
    }
  }

  Future<void> storeToken({required String token}) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String> readToken() async {
    String token = await storage.read(key: 'token') as String;
    return token;
  }
}