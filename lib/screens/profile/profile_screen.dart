import 'package:ab3ad/constants.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:ab3ad/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "الملف الشخصي",
            style: TextStyle(
              fontSize: 16,
              color: kTextColor
            ),
          ),
        ),
        body: const Body(),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile),
      ),
    );
  }
}
