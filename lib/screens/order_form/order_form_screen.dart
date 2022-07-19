import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/itemsController.dart';
import 'package:ab3ad/enums.dart';
import 'package:ab3ad/models/Category.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../size_config.dart';
import '../../utils/.env.dart';
import 'components/body.dart';

class OrderFormScreen extends StatelessWidget {
  OrderFormScreen({Key? key}) : super(key: key);

  final ItemsController _itemsController = 
    Get.find<ItemsController>();
  @override
  Widget build(BuildContext context) { 
    final Category categoryAgrs = ModalRoute.of(context)!.settings.arguments as Category;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(" اضافة الطلب للسلة", 
          style: TextStyle(
            fontSize: 16,
            color: kTextColor,
            fontWeight: FontWeight.bold)
          ),
        ),
        body: FutureBuilder(
          future: _itemsController.fetchItems(itemsEndPoint: "$baseUri/items/${categoryAgrs.id}"),
          builder: (context, AsyncSnapshot snapshot) {
            return Obx((() => 
              _itemsController.isLoading.value 
              ? Center(
                child: SizedBox(
                  width: getScreenSize(context) * 20.0,
                  height: getScreenSize(context) * 20.0,
                  child: Image.asset("assets/images/liquid-loader.gif")
                ),
              )
              : Body(category: categoryAgrs, items: _itemsController.itemsList)
            ));
          }
        ),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.orderForm),
      ),
    );
  }
}
