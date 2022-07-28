import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'components/body.dart';
import '../../constants.dart';
import '../../enums.dart';


class SettingsScreen extends StatelessWidget {

  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 
          "settings_screen_title".tr,
          style: const TextStyle(
            fontSize: 16,
            color: kTextColor
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.settings)
    );
  }
}