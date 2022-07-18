
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const VerticalSpacing(of: 2.0),
          const Text(
            "osama babiker",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(of: 2.0),
          ProfileMenu(
            text: "الاعدادات",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "طلبات التوصيل",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "تسجيل خروج",
            icon: "assets/icons/Log out.svg",
            press: () async {},
          ),
        ],
      ),
    );
  }
}
