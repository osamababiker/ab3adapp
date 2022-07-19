import 'package:ab3ad/controllers/authController.dart';
import 'package:get/get.dart';

class AuthControllerBinding implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut<AuthController>(() => AuthController());
  } 
}