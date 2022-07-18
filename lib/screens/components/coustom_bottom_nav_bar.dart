
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : kTextColor,
                  ),
                  onPressed: () => {}),
                IconButton(
                  icon: SvgPicture.asset("assets/icons/location.svg",
                      color: MenuState.orders == selectedMenu
                          ? kPrimaryColor
                          : kTextColor),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset("assets/icons/question_mark.svg",
                      color: MenuState.settings == selectedMenu
                          ? kPrimaryColor
                          : kTextColor),
                  onPressed: () {},
                ),
                IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/User_Icon.svg",
                      color: MenuState.profile == selectedMenu
                          ? kPrimaryColor
                          : kTextColor,
                    ),
                    onPressed: () => {}),
              ],
            )
          )
        );
  }
}
