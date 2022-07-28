import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/controllers/locationController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/order.dart';
import '../services/orders_service.dart';
import '../utils/.env.dart';

class OrdersController extends GetxController{
  var isLoading = true.obs;
  var ordersList = <Order>[].obs;
  late Order order;
  TextEditingController confirmOrderController = TextEditingController();
  final OrdersService _ordersService = OrdersService();
  late AuthController authController;
  late LocationControler locationControler;

  @override
  void onInit() {
    authController = Get.put(AuthController());
    locationControler = Get.put(LocationControler());
    super.onInit();
  }

  Future fetchOrders() async {
    isLoading(true);
    await _ordersService.fetchOrders(ordersEndPoint: "$fetchOrdersEndPoint/${authController.user.id}").then((response) {
      ordersList.value = response;
    }, onError: (error) {});
    isLoading(false);
  }

  Future fetchSingleOrder({required int orderId}) async{
    isLoading(true);
    await _ordersService.fetchSingleOrder(orderId: orderId).then((response) {
      order = response;
    }, onError: (error) {});
    isLoading(false);
  }

  Future sendOrder({required var formData}) async {
    isLoading(true);
    await _ordersService.sendOrder(formData: formData);
    isLoading(false);
    return true;
  }
}
