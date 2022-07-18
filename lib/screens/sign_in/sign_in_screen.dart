import 'package:ab3ad/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "تسجيل دخول",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kTextColor
            ),
          ),
        ),
        body: const Body(),
      ),
    );
  }
}
