import 'package:ab3ad/constants.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
        bottomNavigationBar: const CheckoutCard(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "عربة التسوق الخاصة بك",
        style: TextStyle(color: kTextColor, fontSize: 16),
      ),
    );
  }
}
