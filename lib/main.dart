import 'package:ab3ad/bindings/networkControllersBindings.dart';
import 'package:ab3ad/routes.dart';
import 'package:ab3ad/translations/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ab3ad/theme.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'app_name'.tr,
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar','ar-eg'),
      translationsKeys: AppTranslation.translationsKeys,
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      initialBinding: NetworkControllersBindings(),
      getPages: Routes.routes,
    );
  } 
}
