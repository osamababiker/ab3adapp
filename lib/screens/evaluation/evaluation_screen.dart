
import 'package:ab3ad/models/order.dart';
import 'package:ab3ad/translations/translations.dart';
import 'package:flutter/material.dart';
import 'package:ab3ad/constants.dart';
import 'package:ab3ad/enums.dart';
import 'package:ab3ad/screens/components/coustom_bottom_nav_bar.dart';
import 'package:get/get.dart';
import '../../controllers/driversController.dart';
import '../../size_config.dart';
import 'components/body.dart';


class EvaluationScreen extends StatelessWidget {

  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    final Order arguments = Get.arguments;
    final DriversController _driverController = 
    Get.find<DriversController>();
 
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "evaluation_screen_title".tr,
          style: const TextStyle(
            fontSize: 16,
            color: kTextColor
          ),
        ),
      ),
      body: FutureBuilder(
        future: _driverController.fetchAcceptedRequest(orderId: arguments.id),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return Body(deliveryRequest: _driverController.deliveryRequest);
          }else {
            return Center(
              child: SizedBox(
                width: getScreenSize(context) * 4.0,
                height: getScreenSize(context) * 4.0,
                child: const CircularProgressIndicator(backgroundColor: kPrimaryColor, color: Colors.white)
              ),
            );
          }
        }
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders));
  }
}