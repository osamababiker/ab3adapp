import 'package:ab3ad/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import 'form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 2,
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getScreenSize(context) * 2.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getScreenSize(context) * 2.0),
                  SizedBox(
                    width: getScreenSize(context) * 10.0,
                    height: getScreenSize(context) * 10.0,
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      height: getScreenSize(context) * 26.5,
                      width: getScreenSize(context) * 23.5,
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Text(
                    "signin_screen_title".tr,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: getScreenSize(context) * 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSpacing(of: 3.0),
                  SignForm(), 
                  const VerticalSpacing(of: 1.0),
                  SizedBox(height: getScreenSize(context) * 2.0),
                  SingleChildScrollView(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
