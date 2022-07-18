
import 'package:ab3ad/screens/components/custom_suffix_icon.dart';
import 'package:ab3ad/screens/sign_in/sign_in_screen.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/custom_surfix_icon.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:ab3ad/screens/components/form_error.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
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
          const FormError(errors: []),
          SizedBox(height: getScreenSize(context) * 2.0),
          DefaultButton(
            text: "انشاء حساب",
            press: () async{},
          )
        ],
      ),
    );
  }


  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onChanged: (value){ 
      },
      validator: (value){
      },
      decoration: const InputDecoration(
        labelText: "الاسم",
        hintText: "ادخل الاسم كاملا",
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg",),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      onChanged: (value){
      },
      validator: (value){
      },
      decoration: const InputDecoration(
        labelText: "العنوان",
        hintText: "ادخل عنوان السكن",
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Location_point.svg",),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onChanged: (value){
      },
      validator: (value){
      },
      decoration: const InputDecoration(
        labelText: "رقم الهاتف",
        hintText: "ادخل رقم الهاتف",
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg",),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => {},
      onChanged: (value) {
        if (value.isNotEmpty) {}
      },
      validator: (value) {
      },
      decoration: const InputDecoration(
        labelText: "تأكيد كلمة المرور",
        hintText: "قم باعادة ادخال كلمة المرور",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => {},
      onChanged: (value) {
      },
      validator: (value) {
      },
      decoration: const InputDecoration(
        labelText: "كلمة المرور",
        hintText: "قم بادخال كلمة المرور",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
