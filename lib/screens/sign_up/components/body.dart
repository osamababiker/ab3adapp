import 'package:ab3ad/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getScreenSize(context) * 2.0),
            child: SingleChildScrollView(
              child: Column(
                children: [ 
                  SizedBox(height: getScreenSize(context) * 2.0), 
                  SizedBox(
                    width: getScreenSize(context) * 10.0,
                    height: getScreenSize(context) * 10.0,
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      height: getScreenSize(context) * 26.5,
                      width: getScreenSize(context) * 23.5,
                    ),
                  ),
                  Text(
                    "انشاء حساب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getScreenSize(context) * 2.5,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const VerticalSpacing(of: 2.0), 
                  const SignUpForm(),
                  SizedBox(height: getScreenSize(context) * 2.0), 
                  const Text(
                    'بانشاء حسابك فانك توافق على شروط وسياسات الاستخدام للتطبيق',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 14
                    ),
                  ),
                  SizedBox(height: getScreenSize(context) * 4.0), 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
