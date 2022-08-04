import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/models/deliveryRequest.dart';
import 'package:ab3ad/services/drivers_service.dart';
import 'package:get/get.dart';

import '../utils/.env.dart';

class DriversController extends GetxController{
  var isLoading = true.obs;
  var isButtonPressed = false.obs;
  var requestsList = <DeliveryRequest>[].obs;
  late DeliveryRequest deliveryRequest;
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
      requestsEndPoint: "$fetchDeliveryRequestsEndPoint/${authController.user.id}").then((response) {
      requestsList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }
 
  
  Future fetchAcceptedRequest({required int orderId}) async {
    isLoading(true);
    await _driverService.fetchAcceptedRequest(orderId: orderId).then((response) {
      deliveryRequest = response;
    }, onError: (error){
      print(error);
    });
    isLoading(false);
  } 

  Future<bool> sendDeliveryRequest({required Map formData}) async {
    isButtonPressed(true);
    await _driverService.sendDeliveryRequest(formData: formData);
    isButtonPressed(false);
    return true; 
  }

  Future<bool> orderCompleteSign({required Map formData}) async {
    isButtonPressed(true);
    await _driverService.orderComplete(formData: formData);
    isButtonPressed(false);
    return true;
  }


}