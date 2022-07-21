import 'package:ab3ad/constants.dart';
import 'package:ab3ad/models/order.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import '../../enums.dart';
import '../components/default_button.dart';

class TakeOrderScreen extends StatelessWidget {
  const TakeOrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Order agrs = ModalRoute.of(context)!.settings.arguments as Order;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "قبول هذا  الطلب",
            style: TextStyle(color: kTextColor, fontSize: 16),
          ),
        ),
        body: const Body(),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.orders),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "عنوان التوصيل",
                        style: TextStyle(fontSize: 16, color: kTextColor),
                      ),
                      const VerticalSpacing(of: 2.0),
                      const Text(
                          "Dubai",
                          style: TextStyle(
                              fontSize: 16,
                              color: kTextColor,
                              fontWeight: FontWeight.bold),
                      ),
                      const VerticalSpacing(of: 2.0),
                      DefaultButton(
                        text: "توصيل الطلبية",
                        press: () async {},
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
