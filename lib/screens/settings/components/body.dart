import 'package:ab3ad/controllers/settingsController.dart';
import 'package:ab3ad/size_config.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ab3ad/constants.dart';

class Body extends StatelessWidget {
  
  Body({ Key? key }) : super(key: key);
  final SettingsController _settingsController = 
  Get.find<SettingsController>();
  String? _selectedLang ;
  final List<String> _langList = [
    "ar", "en"
  ];
 
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
              const VerticalSpacing(of: 5.0),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: [
                        const Icon(
                          Icons.list,
                          size: 16,
                          color: kTextColor,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          child: Text(
                            "settings_screen_change_langauge".tr,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: _langList
                      .map((_lang) => DropdownMenuItem<String>(
                          value: _lang,
                          child: Text(
                            _lang == 'ar' ? 'arabic'.tr : 'english'.tr,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                    value: _selectedLang,
                    onChanged: (value) {
                      _settingsController.changeLanguage = value.toString();
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: kTextColor,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 50,
                    buttonWidth: 200,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 200,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                      color: Colors.white,
                    ),
                    scrollbarRadius: const Radius.circular(kDefaultPadding / 2),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
          
    );
  }
}