import 'package:ab3ad/controllers/imagePickerController.dart';
import 'package:get/get.dart';

class ImageControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<ImagePickerController>(() => ImagePickerController());
  }
}