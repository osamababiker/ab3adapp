import 'package:ab3ad/controllers/settingsController.dart';
import 'package:get/get.dart';

class SettingsControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}