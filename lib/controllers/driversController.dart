import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/models/deliveryRequest.dart';
import 'package:ab3ad/services/drivers_service.dart';
import 'package:get/get.dart';

import '../utils/.env.dart';

class DriversController extends GetxController{
  var isLoading = true.obs;
  var requestsList = <DeliveryRequest>[].obs;
  final DriversService _driverService = DriversService();
  late AuthController authController;

  @override 
  void onInit() {
    authController = Get.put(AuthController());
    fetchRequests();
    super.onInit(); 
  }

  Future fetchRequests() async{
    isLoading(true);
    await _driverService.fetchRequests( 
      requestsEndPoint: "$fetchDeliveryRequestsEndPoint/${authController.user.id}")
    .then((response) {
      requestsList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }
 
 
  Future fetchAcceptedRequests({required int orderId}) async {
    isLoading(true);
    await _driverService.fetchAcceptedRequests(orderId: orderId).then((response) {
      requestsList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  } 

  Future<bool> sendDeliveryRequest({required Map formData}) async {
    isLoading(true);
    await _driverService.sendDeliveryRequest(formData: formData);
    isLoading(false);
    return true; 
  }

  Future<bool> orderCompleteSign({required Map formData}) async {
    isLoading(true);
    await _driverService.orderComplete(formData: formData);
    isLoading(false);
    return true;
  }


}