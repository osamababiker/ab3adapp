import 'package:flutter/material.dart';
import 'package:ab3ad/size_config.dart';
import 'package:get/get.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(getScreenSize(context) * 2.0),
      padding: EdgeInsets.symmetric(
        horizontal: getScreenSize(context) * 2.0,
        vertical: getScreenSize(context) * 3.5,
      ),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: getScreenSize(context) * 25.0,
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "home_screen_discount_section_slogn".tr,
                      style: const TextStyle(
                        fontSize: 18
                      )
                    ),
                    const TextSpan(
                      text: "\n"
                    ),
                    TextSpan(
                      text: "home_screen_discount_section_action".tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: getScreenSize(context) * 8.0,
              height: getScreenSize(context) * 8.0, 
              child: Image.asset("assets/images/logos_black.png")
            )
          ],
        ),
      ),
    );
  }
}
