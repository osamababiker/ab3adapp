import 'package:ab3ad/models/order.dart';
import 'package:get/get.dart';
import '../utils/.env.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OrdersService extends GetConnect{

  static const storage = FlutterSecureStorage();

  List<Order> parseOrders(List responseBody) {
    return responseBody.map<Order>((json) => Order.fromJson(json)).toList();
  }

  Future<List<Order>> fetchOrders({required String ordersEndPoint}) async {
    String token = await storage.read(key: 'token') as String;
    final response = await get(
      ordersEndPoint,
      headers: {'Authorization': 'Bearer $token'}
    ); 
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseOrders(response.body['data']);
    }  
  } 

  Future<Order> fetchSingleOrder({required int orderId}) async {
    String token = await storage.read(key: 'token') as String;
    final response = await get(
      "$fetchOrdersEndPoint/$orderId",
      headers: {'Authorization': 'Bearer $token'}
    ); 
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return Order.fromJson(response.body['data']);
    }  
  } 
  

  Future<bool> sendOrder({required FormData formData}) async {
    String token = await storage.read(key: 'token') as String;
    final response = await post(
      sendOrderEndPoint, 
      formData,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return true;
    } 
  }

  Future<bool> updateOrder({required Map formData}) async {
    String token = await storage.read(key: 'token') as String;
    final response = await post(
      updateOrderEndPoint,
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