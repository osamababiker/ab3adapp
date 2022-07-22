import 'package:ab3ad/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(
          "signin_screen_title".tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kTextColor
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
