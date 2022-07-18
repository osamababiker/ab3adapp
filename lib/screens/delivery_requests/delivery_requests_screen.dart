import 'package:ab3ad/constants.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/body.dart';


class DeliveryRequestsScreen extends StatelessWidget {
  const DeliveryRequestsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "طلبات التوصيل",
            style: TextStyle(color: kTextColor, fontSize: 16),
          ),
        ),
        body: Body(),
        bottomNavigationBar:  const CustomBottomNavBar(selectedMenu: MenuState.orders),
      ),
    );
  }
}


