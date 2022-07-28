import 'package:ab3ad/controllers/evaluationsController.dart';
import 'package:get/get.dart';

class EvaluationsControllersBindings implements Bindings{
  @override 
  void dependencies() {
    Get.lazyPut<EvaluationsController>(() => EvaluationsController());
  }
}