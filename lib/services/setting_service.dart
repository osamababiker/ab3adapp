import 'package:ab3ad/models/setting.dart';
import 'package:get/get.dart';

import '../utils/.env.dart';

class SettingsService extends GetConnect{
  Future<Setting> fetchSettings() async {
    final response = await get(settingsEndPoint); 
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return Setting.fromJson(response.body['data']);
    }  
  }
}