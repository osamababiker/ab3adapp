import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'components/body.dart';
import '../../constants.dart';
import '../../enums.dart';

class SettingsScreen extends StatelessWidget {

  static String routeName = "/settings";

  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "معلومات عن التطبيق",
            style: TextStyle(
              fontSize: 16,
              color: kTextColor
            ),
          ),
        ),
        body: const Body(),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.settings),
      ),
    );
  }
}