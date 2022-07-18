import 'package:ab3ad/constants.dart';
import 'package:ab3ad/enums.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'components/form_body.dart';

class OrderFormScreen extends StatelessWidget {
  const OrderFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(" اضافة الطلب للسلة", 
          style: TextStyle(
            fontSize: 16,
            color: kTextColor,
            fontWeight: FontWeight.bold)
          ),
        ),
        body: const FormBody(),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.orderForm),
      ),
    );
  }
}
