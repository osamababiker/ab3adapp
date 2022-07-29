import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/ordersController.dart';
import 'package:ab3ad/enums.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../size_config.dart';
import 'components/body.dart';

class OrdersScreen extends StatelessWidget {

  OrdersScreen({Key? key}) : super(key: key);
  final OrdersController _ordersController = 
  Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(
          "orders_screen_title".tr,
        style: const TextStyle(
            fontSize: 16,
            color: kTextColor,
            fontWeight: FontWeight.bold)
          ),
      ),
      body: FutureBuilder(
        future: _ordersController.fetchOrders(),
        builder: (context, AsyncSnapshot snapshot) {
          if(!_ordersController.isLoading.value){
            return Body(orders: snapshot.data);
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
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
