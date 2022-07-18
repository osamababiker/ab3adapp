
import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    text: "المجموع :\n",
                    children: [
                      TextSpan(
                        text: "1200 جنيه",
                        style: TextStyle(
                            fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getScreenSize(context) * 25.0,
                  child: DefaultButton(
                    text: "اختر موقع التوصيل",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
