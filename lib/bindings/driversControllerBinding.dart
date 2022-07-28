import 'package:ab3ad/controllers/driversController.dart';
import 'package:get/get.dart';

class DriversControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<DriversController>(() => DriversController());
  }
}