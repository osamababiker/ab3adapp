import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ab3ad/models/User.dart';
import 'package:get/get.dart';

import '../utils/.env.dart';

class AuthService extends GetConnect {
  late String token;
  final storage = const FlutterSecureStorage();

  Future login({required Map formData}) async {
    final response = await post(loginEndPoint,formData,
      headers: {"Accept": "application/json"},
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      String token = response.body['data'].toString();
      return await tryToken(token: token);
    }
  }

  Future register({required Map formData}) async{
    final response = await post(registerEndPoint, formData, 
      headers: {"Accept": "application/json"}
    );
    if(response.status.hasError){
      return Future.error(response.statusText.toString());
    } else {
      String token = response.body['data'].toString();
      return await tryToken(token: token);
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