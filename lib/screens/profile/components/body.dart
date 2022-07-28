
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/authController.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {

  Body({Key? key}) : super(key: key);
  final AuthController _authController = 
  Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const VerticalSpacing(of: 2.0),
          Text(
            _authController.user.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(of: 2.0),
          ProfileMenu(
            text: "profile_screen_settings_btn".tr,
            icon: "assets/icons/question_mark.svg",
            press: () {},
          ),  
          ProfileMenu(
            text: "profile_screen_orders_btn".tr,
            icon: "assets/icons/bag.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "profile_screen_signout_btn".tr,
            icon: "assets/icons/Log_out.svg",
            press: () async {
              await _authController.signOut();
              Get.offNamed('/signin');
            },
          ),
        ],
      ),
    );
  }
}
