import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/ordersController.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../enums.dart';
import '../../size_config.dart';
import 'components/body.dart';


class DeliveryScreen extends StatelessWidget {
  
  DeliveryScreen({Key? key}) : super(key: key);
  final OrdersController _ordersController = 
  Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "delivery_screen_title".tr,
          style: const TextStyle(color: kTextColor, fontSize: 16),
        ),
      ), 
      body: FutureBuilder(
        future: _ordersController.fetchOrders(),
        builder: (context, AsyncSnapshot snapshot) {
          return Obx(() => 
            _ordersController.isLoading.value 
            ? Center(
              child: SizedBox(
                width: getScreenSize(context) * 4.0,
                height: getScreenSize(context) * 4.0,
                child: const CircularProgressIndicator(backgroundColor: kPrimaryColor, color: Colors.white)
              ),
            )
            : Body()
          );
        }
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
