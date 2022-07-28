import 'package:ab3ad/constants.dart';
import 'package:ab3ad/models/order.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../enums.dart';
import 'components/body.dart';

class TakeOrderScreen extends StatelessWidget {
  const TakeOrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Order agrs = ModalRoute.of(context)!.settings.arguments as Order;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "قبول هذا  الطلب",
            style: TextStyle(color: kTextColor, fontSize: 16),
          ),
        ),
        body: const Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
      ),
    );
  }
}


