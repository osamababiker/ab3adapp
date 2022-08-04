import 'package:ab3ad/models/deliveryRequest.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../utils/.env.dart';

class DriversService extends GetConnect{

  DriversService() {
    timeout = const Duration(seconds: 30);
  }

  static const storage = FlutterSecureStorage();
  
  List<DeliveryRequest> parseRequests(List responseBody) {
    return responseBody.map<DeliveryRequest>((json) => DeliveryRequest.fromJson(json)).toList();
  }

  Future<List<DeliveryRequest>> fetchRequests({required String requestsEndPoint}) async {
    String token = await storage.read(key: 'token') as String;
    final response = await get(
      requestsEndPoint, 
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"}
    ); 
    if (response.status.hasError) {
      if(response.status.connectionError){
        Get.toNamed('/noInternet');
      }
      return Future.error(response.statusText.toString());
    } else {
      return parseRequests(response.body['data']);
    }  
  }
  
  Future<DeliveryRequest> fetchAcceptedRequest({required int orderId}) async {
     String token = await storage.read(key: 'token') as String;
    final response = await get(
      "$fetchAcceptedRequestEndPoint/$orderId",
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"}
    ); 
    if (response.status.hasError) {
      if(response.status.connectionError){
        Get.toNamed('/noInternet');
      }
      return Future.error(response.statusText.toString());
    } else {
      return DeliveryRequest.fromJson(response.body['data']);
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
      if(response.status.connectionError){
        Get.toNamed('/noInternet');
      }
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
      if(response.status.connectionError){
        Get.toNamed('/noInternet');
      }
      return Future.error(response.statusText.toString());
    } else {
      return true;
    }
  }


}