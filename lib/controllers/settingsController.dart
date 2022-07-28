import 'package:ab3ad/services/setting_service.dart';
import 'package:get/get.dart';

import '../models/setting.dart';

class SettingsController extends GetxController{
  var isLoading = false.obs;
  late Rx<Setting> info;
  final SettingsService _settingsService = SettingsService();
  @override
  void onInit() {
    super.onInit();
    fetchSettings();
  }

  Future fetchSettings() async{ 
    await _settingsService.fetchSettings().then((response) {
      info.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }
} 