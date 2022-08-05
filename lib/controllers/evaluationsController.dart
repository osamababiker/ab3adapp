import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/models/evaluation.dart';
import 'package:ab3ad/services/evaluations_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../utils/.env.dart'; 

class EvaluationsController extends GetxController{
  var isLoading = true.obs;
  var isButtonPressed = false.obs;
  var evaluationList = <Evaluation>[].obs;
  final EvaluationService _evaluationService = EvaluationService();
  late AuthController authController;
  final evaluationformKey = GlobalKey<FormState>();
  final TextEditingController evaluationController = TextEditingController();
  RxDouble rating = 0.0.obs;

  @override 
  void onInit() {
    authController = Get.put(AuthController());
    fetchEvaluations();
    super.onInit();
  } 

  Future fetchEvaluations() async{
    isLoading(true);
    await _evaluationService.fetchEvaluations(
      evaluationEndPoint: "$fetchevaluationEndPoint/${authController.user.id}")
    .then((response) {
      evaluationList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }
 
  Future<bool> saveEvaluation({required Map formData}) async {
    isButtonPressed(true);
    await _evaluationService.saveEvaluation(formData: formData);
    isButtonPressed(false);
    return true;
  }

}