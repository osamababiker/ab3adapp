import 'package:ab3ad/controllers/locationController.dart';
import 'package:get/get.dart';

class LocationControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<LocationControler>(() => LocationControler());
  }
}