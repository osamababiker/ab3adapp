import 'dart:io';
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/locationController.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../models/User.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  late TextEditingController 
  phoneController, 
  nameController,
  addressController,
  passwordController,
  passwordConfirmController;
  final AuthService _authService = AuthService();
  final storage = const FlutterSecureStorage();
  bool get authenticated => isLoggedIn.value;
  bool get verified => isVerified.value;
  RxBool isLoggedIn = false.obs;
  RxBool isVerified = false.obs;
  RxBool signinIsLoading = false.obs;
  RxBool signupIsLoading = false.obs;
  late User authUser;
  User get user => authUser;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late String deviceName, notificationToken;
  late LocationControler locationController;

  @override
  void onInit() {
    phoneController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    locationController = Get.put(LocationControler());
    getDeviceName();
    getNotificationToken();
    tryToken();
    super.onInit();
  }


  void getNotificationToken() =>
    FirebaseMessaging.instance.getToken().then((value) => notificationToken = value.toString());


  void getDeviceName() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceName = androidInfo.model!;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceName = iosInfo.utsname.machine!;
      }
    } catch (e) {
      print(e);
    }
  }

  Future tryToken() async {
    String token = await _authService.readToken();
    await _authService.tryToken(token: token).then((response) {
      authUser = response; 
      isLoggedIn.value = true;
    }, onError: (error) {
      print("error: $error");
    });
  }

  String? validateName(String name){
    if(name.isEmpty){
      return "signup_screen_name_validation_error".tr; 
    }
    return null;
  }

  String? validateAddress(String address){
    if(address.isEmpty){
      return "signup_screen_address_validation_error".tr;
    }
    return null;
  }

  String? validatePhone(String phone) {
    if (!GetUtils.isPhoneNumber(phone)) {
      return "signin_screen_phone_validation_error".tr;
    }
    return null;
  }
 
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "signin_screen_password_validation_error".tr;
    }else if(password.length < 6){
      return "signup_screen_password_short_validation_error".tr;
    }
    return null;
  }

  String? validatePasswordConfirm(String password) {
    if (password.isEmpty || passwordController.text != password) {
      return "signup_screen_password_confirm_validation_error".tr;
    }
    return null;
  }

  // signin a new user
  signIn() async{
    final isValid = signinFormKey.currentState!.validate();
    if (!isValid) {
      signinIsLoading.value = false;
      return;
    }
    Map<String, dynamic> formData = {
      'password': passwordController.text,
      'phone': phoneController.text,
      'device_name': deviceName
    };
    await _authService.login(formData: formData).then((response) {
      authUser = response;
      isLoggedIn(true);
      signinIsLoading.value = false;
      Get.offAllNamed('/home');
    }, onError: (error) {
      Get.snackbar(
        "signup_screen_signin_error_title".tr, 
        "signup_screen_signin_error_message".tr,
        backgroundColor: kPrimaryColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM
      );
      signinIsLoading.value = false;
    });
  }

  // signup a new user
  signUp() async {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      signupIsLoading.value = false;
      return;
    }
    Map<String, dynamic> formData = {
      'name': nameController.text,
      'password': passwordController.text,
      'password_confirmation': passwordConfirmController.text,
      'address': addressController.text, 
      'phone': phoneController.text, 
      'lat': locationController.lat.value, 
      'lng': locationController.lng.value,
      'device_name': deviceName, 
      'notificationToken': notificationToken
    };
    await _authService.register(formData: formData).then((response) {
      authUser = response;
      isLoggedIn(true);
      signupIsLoading.value = false;
      Get.offAllNamed('/home');
    }, onError: (error) {
      Get.snackbar(
        "signup_screen_signup_error_title".tr, 
        "signup_screen_signup_error_message".tr,
        backgroundColor: kPrimaryColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM
      );
      signupIsLoading.value = false;
    });
  }

  signOut() async{
    await _authService.logout();
  }

}