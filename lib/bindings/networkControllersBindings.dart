import 'package:ab3ad/controllers/networkController.dart';
import 'package:get/get.dart';

class NetworkControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}