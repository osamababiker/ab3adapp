import 'package:ab3ad/models/evaluation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../utils/.env.dart';

class EvaluationService extends GetConnect{

  static const storage = FlutterSecureStorage();

  List<Evaluation> parseEvaluations(List responseBody) {
    return responseBody.map<Evaluation>((json) => Evaluation.fromJson(json)).toList();
  }

  Future<List<Evaluation>> fetchEvaluations({required String evaluationEndPoint}) async {
    final response = await get(evaluationEndPoint); 
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseEvaluations(response.body['data']);
    }  
  }

  Future saveEvaluation({required Map formData}) async{
    String token = await storage.read(key: 'token') as String;
    final response = await post(
      saveEvaluationEndPoint,
      formData,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return true;
    }
  }
  
}