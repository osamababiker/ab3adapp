
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/screens/components/custom_suffix_icon.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/custom_surfix_icon.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {

  SignUpForm({Key? key}) : super(key: key);
  final AuthController _authController = 
  Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Form(
        key: _authController.signupFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(height: getScreenSize(context) * 2.0),
            buildPhoneFormField(),
            SizedBox(height: getScreenSize(context) * 2.0),
            buildAddressFormField(),
            SizedBox(height: getScreenSize(context) * 2.0),
            buildPasswordFormField(),
            SizedBox(height: getScreenSize(context) * 2.0),
            buildConformPassFormField(),
            SizedBox(height: getScreenSize(context) * 2.0),
            _authController.signupIsLoading.value ?
            SizedBox(
              width: getScreenSize(context) * 4.0,
              height: getScreenSize(context) * 4.0,
              child: const CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: kPrimaryColor,
              )
            )
            : DefaultButton(
              text: "signup_screen_btn".tr,
              press: () async{
                _authController.signupIsLoading.value = true;
                _authController.signUp(); 
              },
            )
          ],
        ),
      ),
    );
  }


  TextFormField buildNameFormField() {
    return TextFormField( 
      keyboardType: TextInputType.name,
      validator: (value){
        return _authController.validateName(value!);
      },
      controller: _authController.nameController,
      decoration: InputDecoration(
        labelText: "signup_screen_name_label".tr,
        hintText: "signup_screen_name_hint".tr,
        suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/User_Icon.svg",),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      validator: (value){
        return _authController.validateAddress(value!);
      },
      controller: _authController.addressController,
      decoration: InputDecoration(
        labelText: "signup_screen_address_label".tr,
        hintText: "signup_screen_address_hint".tr,
        suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Location_point.svg",),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value){
        return _authController.validatePhone(value!);
      },
      controller: _authController.phoneController,
      decoration: InputDecoration(
        labelText: "signup_screen_phone_label".tr,
        hintText: "signup_screen_phone_hint".tr,
        suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg",),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        return _authController.validatePasswordConfirm(value!);
      },
      controller: _authController.passwordConfirmController,
      decoration: InputDecoration(
        labelText: "signup_screen_password_confirm_label".tr,
        hintText: "signup_screen_password_confirm_hint".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        return _authController.validatePassword(value!);
      },
      controller: _authController.passwordController,
      decoration: InputDecoration(
        labelText: "signup_screen_password_label".tr,
        hintText: "signup_screen_password_hint".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
