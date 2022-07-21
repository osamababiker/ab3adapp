import 'package:ab3ad/constants.dart';
import 'package:ab3ad/enums.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:ab3ad/screens/home/components/body.dart';
import 'package:get/get.dart';
import 'package:ab3ad/controllers/categoriesController.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CategoriesController _categoriesController = 
    Get.find<CategoriesController>();
    
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Obx((() =>   
          _categoriesController.isLoading.value 
          ? Center(
            child: SizedBox(
              width: getScreenSize(context) * 4.0,
              height: getScreenSize(context) * 4.0,
              child: const CircularProgressIndicator(backgroundColor: kPrimaryColor, color: Colors.white)
            ),
          ) 
          : Body(categories: _categoriesController.categoriesList)
        )),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}