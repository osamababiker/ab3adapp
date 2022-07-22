import 'package:flutter/material.dart';
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/size_config.dart';
import 'package:get/get.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[ 
                  const Spacer(),
                  Image.asset(
                    "assets/images/logo.jpg",
                    height: getScreenSize(context) * 26.5,
                    width: getScreenSize(context) * 23.5,
                  ),
                  const Spacer(),
                  Text(
                    "app_name".tr,
                    style: TextStyle(
                      fontSize: getScreenSize(context) * 3.6,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "app_slogan".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                ],
              )
            ),
            const VerticalSpacing(of: kDefaultPadding / 2),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getScreenSize(context) * 2.0),
              child: const CircularProgressIndicator(
                color: kPrimaryColor,
              )
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

}
