import 'package:ab3ad/controllers/categoriesController.dart';
import 'package:get/get.dart';

class CategoriesControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController());
  }
}