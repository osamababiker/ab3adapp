import 'package:ab3ad/controllers/itemsController.dart';
import 'package:get/get.dart';

class ItemsControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<ItemsController>(() => ItemsController());
  }
}