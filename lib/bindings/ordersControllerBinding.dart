import 'package:ab3ad/controllers/ordersController.dart';
import 'package:get/get.dart';

class OrdersControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<OrdersController>(() => OrdersController());
  }
}