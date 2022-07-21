import 'package:ab3ad/controllers/cartController.dart';
import 'package:get/get.dart';

class CartControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<CartDbController>(() => CartDbController());
  }
}