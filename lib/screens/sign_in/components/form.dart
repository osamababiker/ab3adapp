

import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/screens/components/custom_suffix_icon.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/form_error.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatelessWidget {

  SignForm({Key? key}) : super(key: key);
  final AuthController _authController = 
  Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            buildPhoneFormField(),
            SizedBox(height: getScreenSize(context) * 3.0),
            buildPasswordFormField(),
            SizedBox(height: getScreenSize(context) * 3.0),
            FormError(errors: _authController.errors),
            SizedBox(height: getScreenSize(context) * 2.0),
            _authController.isLoading.value ?
            SizedBox(
              width: getScreenSize(context) * 4.0,
              height: getScreenSize(context) * 4.0,
              child: const CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: kPrimaryColor,
              )
            )
            : DefaultButton(
              text: "signin_screen_btn".tr,
              press: () async {
                _authController.isLoading.value = true;
                _authController.checkSignIn(); 
              }
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        _authController.validatePassword(value!);
      },
      decoration: InputDecoration(
        labelText: "signin_screen_password_label".tr,
        hintText: "signin_screen_password_hint".tr,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value){
        _authController.validatePhone(value!);
      },
      controller: _authController.phoneController,
      decoration: InputDecoration(
        labelText: "signin_screen_phone_label".tr,
        hintText: "signin_screen_phone_hint".tr,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
