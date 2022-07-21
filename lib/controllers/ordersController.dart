import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/order.dart';
import '../services/orders_service.dart';

class OrdersController extends GetxController{
  var isLoading = true.obs;
  var ordersList = <Order>[].obs;
  TextEditingController confirmOrderController = TextEditingController();
  final OrdersService _ordersService = OrdersService();

  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  Future fetchOrders() async {
    isLoading(true);
    await _ordersService.fetchOrders().then((response) {
      ordersList.value = response;
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
