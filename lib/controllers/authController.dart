import 'dart:io';
import 'package:ab3ad/controllers/locationController.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
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
  RxBool isLoading = false.obs;
  List errors = [].obs;
  late User _user;
  User get user => _user;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late String deviceName, notificationToken;

  @override
  void onInit() {
    phoneController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    getDeviceName();
    getNotificationToken();
    tryToken();
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    addressController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.onClose();
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

  Future login({required Map formData}) async {
    isLoading(true);
    await _authService.login(formData: formData).then((response) {
      _user = response;
      isLoggedIn(true);
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }

  Future tryToken() async {
    String token = await _authService.readToken();
    isLoading(true);
    await _authService.tryToken(token: token).then((response) {
      _user = response;
      isLoggedIn(true);
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }

  void validateName(String name){
    if(!GetUtils.isTxt(name)){
      errors.add("signup_screen_name_validation_error".tr);
    }else{
      errors.remove("signup_screen_name_validation_error".tr);
    }
  }

  void validateAddress(String address){
    if(!GetUtils.isTxt(address)){
      errors.add("signup_screen_address_validation_error".tr);
    }else{
      errors.remove("signup_screen_address_validation_error".tr);
    }
  }

  void validatePhone(String phone) {
    if (!GetUtils.isPhoneNumber(phone)) {
      errors.add("signin_screen_phone_validation_error".tr);
    }else{
      errors.remove("signin_screen_phone_validation_error".tr);
    }
  }
 
  void validatePassword(String password) {
    if (!GetUtils.isTxt(password)) {
      errors.add("signin_screen_password_validation_error".tr);
    }else{
      errors.remove("signin_screen_password_validation_error".tr);
    }
  }

  void validatePasswordConfirm(String password) {
    if (!GetUtils.isTxt(password)) {
      errors.add("signup_screen_password_confirm_validation_error".tr);
    }else{
      errors.remove("signup_screen_password_confirm_validation_error".tr);
    }
  }


  void checkSignIn() {
    final isValid = signinFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signinFormKey.currentState!.save();
  }

  void checkSignUp() {
    final isValid = signupFormKey.currentState!.validate();
    if(!isValid){
      return;
    }

    LocationControler _locationController = 
    Get.find<LocationControler>();
    Map<String, dynamic> formData = {
      'name': nameController.text,
      'password': passwordController.text,
      'password_confirmation': passwordConfirmController.text,
      'address': addressController.text,
      'phone': phoneController.text,
      'lat': _locationController.lat.value, 
      'lng': _locationController.lng.value,
      'device_name': deviceName, 
      'notificationToken': notificationToken
    };

    print(formData);
  }

}