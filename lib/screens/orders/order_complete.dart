import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../size_config.dart';


class OrderCompleteScreen extends StatelessWidget {

  const OrderCompleteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              width: getScreenSize(context) * 40.0,
              height: getScreenSize(context) * 20.0,
              child: SvgPicture.asset("assets/icons/order_complete.svg")
            ), 
            const SizedBox(height: kDefaultPadding),
            Text(
              "order_complete_screen_message".tr,
              style: const TextStyle(
                fontSize: 16,
                color: kTextColor 
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            GestureDetector(
              onTap: () {
                Get.offNamed('/home');
              },
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "order_complete_screen_btn".tr,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}