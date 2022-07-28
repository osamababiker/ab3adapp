import 'package:ab3ad/constants.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:ab3ad/enums.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "profile_screen_title".tr ,
          style: const TextStyle(
            fontSize: 16,
            color: kTextColor
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
