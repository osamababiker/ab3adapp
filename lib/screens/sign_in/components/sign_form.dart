

import 'package:ab3ad/screens/components/custom_suffix_icon.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/screens/components/form_error.dart';
import '../../../size_config.dart';

class SignForm extends StatelessWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: getScreenSize(context) * 3.0),
          buildPasswordFormField(),
          SizedBox(height: getScreenSize(context) * 3.0),
          const FormError(errors: []),
          SizedBox(height: getScreenSize(context) * 2.0),
          DefaultButton(
            text: "تسجيل دخول",
            press: () async {}
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        
      },
      validator: (value) {
      },
      decoration: const InputDecoration(
  
        labelText: "كلمة المرور",
        hintText: "ادخل كلمة المرور",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onChanged: (value) {

      },
      validator: (value) {
      },
      decoration: const InputDecoration(
        labelText: "رقم الهاتف",
        hintText: "ادخل رقم الهاتف",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
