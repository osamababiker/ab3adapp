import 'package:ab3ad/models/deliveryRequest.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../utils/.env.dart';

class DriversService extends GetConnect{

  static const storage = FlutterSecureStorage();
  
  List<DeliveryRequest> parseRequests(List responseBody) {
    return responseBody.map<DeliveryRequest>((json) => DeliveryRequest.fromJson(json)).toList();
  }

  Future<List<DeliveryRequest>> fetchRequests({required String requestsEndPoint}) async {
    final response = await get(requestsEndPoint); 
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseRequests(response.body['data']);
    }  
  }

  Future<List<DeliveryRequest>> fetchAcceptedRequests({required int orderId}) async {
    final response = await get("$fetchAcceptedRequestsEndPoint/$orderId"); 
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseRequests(response.body['data']);
    }  
  }

  Future sendDeliveryRequest({required Map formData}) async{
    String token = await storage.read(key: 'token') as String;
    final response = await post(
      sendDeliveryRequestEndPoint,
      formData,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return true;
    }
  }

  Future orderComplete({required Map formData}) async{
    String token = await storage.read(key: 'token') as String;
    final response = await post(
      orderCompleteEndPoint,
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