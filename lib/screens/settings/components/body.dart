import 'package:ab3ad/controllers/settingsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ab3ad/constants.dart';

class Body extends StatelessWidget {
  
  Body({ Key? key }) : super(key: key);
  final SettingsController _settingsController = 
  Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
 
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text.rich(
                TextSpan(
                  text: "app_name".tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "settings_screen_app_version".tr ,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    TextSpan(
                      text: " : ${_settingsController.info.appVersion}"
                    ),
                  ]
                )
              ),
              const SizedBox(height: 15),
              Text.rich(
                TextSpan(
                  text: "settings_screen_app_email".tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    const TextSpan(
                      text: "\n \n"
                    ),
                    TextSpan(
                      text: _settingsController.info.email,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      )
                    )
                  ]
                )
              ),
              const Divider(),
              const SizedBox(height: kDefaultPadding),
              Text.rich(
                TextSpan(
                  text: "settings_screen_app_policy".tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    const TextSpan(
                      text: "\n \n"
                    ),
                    TextSpan(
                      text: _settingsController.info.policy,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      )
                    )
                  ]
                )
              ),
            ]
          ),
        ),
      ),
          
    );
  }
}