import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/enums.dart';
import 'components/body.dart';
import '../../constants.dart';

class LocationScreen extends StatelessWidget {
  static String routeName = "/location";
  
  const LocationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) { 

    return Directionality( 
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "اختر موقع التوصيل",
              style: TextStyle(fontSize: 16, color: kTextColor),
            ),
          ), 
          body: const Body(),
          bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.map)),
    );
  }
}
