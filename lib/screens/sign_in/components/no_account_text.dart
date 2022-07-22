import 'package:ab3ad/constants.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: getScreenSize(context) * 20.0,
            child: Text(
              overflow: TextOverflow.ellipsis,
              "signin_screen_not_having_account".tr,
              style: TextStyle(fontSize: getScreenSize(context) * 1.6),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/signup'),
            child: Text(
              "signin_screen_create_account".tr,
              style: TextStyle(
                  fontSize: getScreenSize(context) * 1.6,
                  color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
