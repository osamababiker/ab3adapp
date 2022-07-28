import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import '../../controllers/settingsController.dart';
import '../../size_config.dart';
import 'components/body.dart';
import '../../constants.dart';
import '../../enums.dart';


class SettingsScreen extends StatelessWidget {

  SettingsScreen({ Key? key }) : super(key: key);
  final SettingsController _settingsController = 
  Get.find<SettingsController>();

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
      body: Obx(() => 
        _settingsController.isLoading.value
        ? Center(
          child: SizedBox(
            width: getScreenSize(context) * 4.0,
            height: getScreenSize(context) * 4.0,
            child: const CircularProgressIndicator(backgroundColor: kPrimaryColor, color: Colors.white)
          ),
        )
       :Body()
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.settings)
    );
  }
}