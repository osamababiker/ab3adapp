
import 'package:ab3ad/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final CartDbController _cartController = 
    Get.find<CartDbController>();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getScreenSize(context) * 1.5,
        horizontal: getScreenSize(context) * 3.0,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const TextField(
            //     keyboardType: TextInputType.text,
            //     decoration: InputDecoration(
            //       hintText: "أدخل كود التخفيض",
            //       hintStyle: TextStyle(color: kTextColor, fontSize: 14),
            //       contentPadding: EdgeInsets.all(kDefaultPadding),
            //     )),
            // SizedBox(height: getScreenSize(context) * 2.0),
            FutureBuilder(
              future: _cartController.getCartTotal(),
              builder: (context, AsyncSnapshot snapshot) {
                return Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "cart_screen_check_out_total".tr,
                            style: const TextStyle(
                              fontSize: 16, color: Colors.black
                            ),
                          ),
                          const TextSpan(
                            text: "\n"
                          ),
                          TextSpan(
                            text: _cartController.isLoading.value ? "" : "${snapshot.data} ",
                            style: const TextStyle(
                              fontSize: 16, color: Colors.black
                            ),
                          ),
                          TextSpan(
                            text: "cart_screen_check_out_currancy".tr
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getScreenSize(context) * 20.0,
                      child: DefaultButton(
                        text: "cart_screen_check_out_delivery_btn".tr,
                        press: () {
                          Get.toNamed('/location');
                        },
                      ),
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
