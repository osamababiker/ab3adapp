import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/driversController.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/ordersController.dart';
import '../../enums.dart';
import '../../size_config.dart';
import 'components/body.dart';


class DeliveryRequestsScreen extends StatelessWidget {
  
  DeliveryRequestsScreen({ Key? key }) : super(key: key);
  final DriversController _driverController = 
  Get.find<DriversController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "delivery_requests_screen_title".tr,
          style: const TextStyle(color: kTextColor, fontSize: 16),
        ),
      ), 
      body: Obx(() => 
        _driverController.isLoading.value
        ? Center(
          child: SizedBox(
            width: getScreenSize(context) * 4.0,
            height: getScreenSize(context) * 4.0,
            child: const CircularProgressIndicator(backgroundColor: kPrimaryColor, color: Colors.white)
          ),
        )
        : Body() 
      ),
      bottomNavigationBar:  CustomBottomNavBar(selectedMenu: MenuState.orders),
    );
  }
}


