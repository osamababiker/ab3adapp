import 'package:ab3ad/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    Size size = MediaQuery.of(context).size;
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
            const Text(
              "تم ارسال الطلب بنجاح",
              style: TextStyle(
                fontSize: 16,
                color: kTextColor
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "مواصلة التسوق",
                  style: TextStyle(
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