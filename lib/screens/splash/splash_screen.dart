import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ab3ad/screens/splash/components/body.dart';
import 'package:get/get.dart';

import '../../controllers/authController.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final AuthController _authController = 
  Get.find<AuthController>();
  
  @override
  void initState(){
    super.initState();
    isAuthenticated();
  }

  Future<void> isAuthenticated() async{
    await _authController.tryToken();
    if(_authController.authenticated){
      print('finr');
      Get.offNamed('/home');
    }else{
      startTime();
    }
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Get.offNamed('/signin'); 
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
