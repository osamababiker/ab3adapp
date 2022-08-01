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
      if(response.status.isUnauthorized){
        return Future.error("signin_screen_unauthorized_message".tr);
      }else{return Future.error("signin_screen_signin_error_message".tr);}
      
    } else {
      String token = response.body.toString();
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
      return User.fromJson(response.body);
    }
  }

  Future<void> logout() async {
    token = await readToken();
    final response = await get(logoutEndPoint, 
    headers: {'Authorization': 'Bearer $token'});
    if(response.status.hasError){
      return Future.error(response.statusText.toString());
    }else {
      cleanToken();
    }
  }

  Future<void> storeToken({required String token}) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String> readToken() async {
    var token = await storage.read(key: 'token');
    if(token != null) return token.toString();
    return '';
  }

  void cleanToken() async {
    await storage.delete(key: 'token');
  }
}