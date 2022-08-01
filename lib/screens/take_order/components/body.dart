import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/controllers/driversController.dart';
import 'package:ab3ad/controllers/locationController.dart';
import 'package:ab3ad/models/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../components/default_button.dart';


class Body extends StatelessWidget {

  Body({Key? key, required this.order}) : super(key: key);
  final Order order;
  final LocationControler _locationControler = 
  Get.find<LocationControler>();
  final AuthController _authController = 
  Get.find<AuthController>();
  final DriversController _driversController = 
  Get.find<DriversController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: _locationControler.getAddress(
        lat: double.parse(order.customerLat), 
        lng: double.parse(order.customerLng)),
      builder: (context, AsyncSnapshot snapshot) {
        if(!_locationControler.isLoading.value){
          return SizedBox(
            width: size.width,
            height: size.height * 0.8,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "take_order_screen_delivery_address".tr,
                              style: const TextStyle(fontSize: 16, color: kTextColor),
                            ),
                            const VerticalSpacing(of: 2.0),
                            Text(
                                snapshot.data, 
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold),
                            ),
                            const VerticalSpacing(of: 2.0),
                            DefaultButton(
                              text: "take_order_screen_deliver_order_btn".tr,
                              press: () async {
                                 Map formData = { 
                                  'customerId': order.user.id,
                                  'driverId': _authController.user.id,
                                  'orderId': order.id
                                };

                                bool checkRequest = await _driversController.sendDeliveryRequest(formData: formData);
                                if(checkRequest){
                                  Get.snackbar(
                                    "take_order_screen_success_title".tr, 
                                    "take_order_screen_success_message".tr,
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: kPrimaryColor,
                                    colorText: Colors.white
                                  );
                                }else{
                                  Get.snackbar(
                                    "take_order_screen_error_title".tr, 
                                    "take_order_screen_error_message".tr,
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: kPrimaryColor,
                                    colorText: Colors.white
                                  );
                                }
                              },   
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        }else {
          return Center(
            child: SizedBox(
              width: getScreenSize(context) * 4.0,
              height: getScreenSize(context) * 4.0,
              child: const CircularProgressIndicator(backgroundColor: kPrimaryColor, color: Colors.white)
            ),
          );
        }
      }
    );
  }
}