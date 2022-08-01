import 'package:ab3ad/constants.dart';
import 'package:ab3ad/models/order.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../enums.dart';
import 'components/body.dart';

class TakeOrderScreen extends StatelessWidget {
  const TakeOrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Order agrs = Get.arguments;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "take_order_screen_title".tr,
            style: const TextStyle(color: kTextColor, fontSize: 16),
          ),
        ),
        body: Body(order: agrs),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
      ),
    ); 
  }
}


