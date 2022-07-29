import 'package:ab3ad/services/setting_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/setting.dart';

class SettingsController extends GetxController{
  var isLoading = true.obs;
  late Setting info;
   var selectedLanguage = Get.locale!.languageCode.obs;
  final SettingsService _settingsService = SettingsService();

  
  @override
  void onInit() { 
    super.onInit();
    fetchSettings();
  }

  Future fetchSettings() async{ 
    isLoading(true);
    await _settingsService.fetchSettings().then((response) {
      info = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }

  set changeLanguage(String lang) {
    Locale locale = Locale(lang);
    Get.updateLocale(locale);
    selectedLanguage.value = lang;
  }
  
} 