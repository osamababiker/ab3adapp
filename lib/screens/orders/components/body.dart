import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/models/order.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/ordersController.dart';
import '../../../utils/.env.dart';


class Body extends StatelessWidget {

  Body({Key? key, required this.orders}) : super(key: key);
  final List<Order> orders;
  final AuthController _authController = 
  Get.find<AuthController>();
  final OrdersController _ordersController = 
  Get.find<OrdersController>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(orders.length,(index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SizedBox(
                            width: getScreenSize(context) * 8.0,
                            height: getScreenSize(context) * 8.0,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: getScreenSize(context) * 4.0,
                                  height: getScreenSize(context) * 4.0,
                                  child: FadeInImage.assetNetwork(
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset("assets/images/spinner.gif");
                                    },
                                    placeholder: "assets/images/spinner.gif",
                                    image: "$uploadUri/items/${orders[index].item.image}"
                                  )
                                ),
                                const VerticalSpacing(of: 1.0),
                                Text(
                                  orders[index].item.name,
                                  style: const TextStyle(fontSize: 16,color: kTextColor),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "orders_screen_quantity".tr,
                            style: const TextStyle(
                                fontSize: 16, color: kTextColor),
                          ),
                          SizedBox(
                              width: getScreenSize(context) * 2.0),
                          Text(
                            "${orders[index].quantity}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        GestureDetector(
                          onTap: () async {},
                          child: Container(
                            width: getScreenSize(context) * 4.0,
                            height: getScreenSize(context) * 4.0,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  kDefaultPadding / 2),
                              child: SvgPicture.asset(
                                  "assets/icons/Trash.svg",
                                  color: Colors.white),
                            ),
                          ),
                        )  
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(kDefaultPadding / 2),
                    child: Row(
                      children: [
                        Text(
                          "orders_screen_order_status".tr,
                          style: const TextStyle(
                              fontSize: 16, color: kTextColor),
                        ),
                        const SizedBox(width: kDefaultPadding / 4),
                        Text(
                          orders[index].status == 0 ? 
                          "orders_screen_pending".tr 
                          : orders[index].status == 1 ?  
                          "orders_screen_delivery".tr
                          : orders[index].status == 2 ? 
                          "orders_screen_delivered".tr
                          : orders[index].status == 3 ?
                          "orders_screen_canceled".tr
                          : "",
                          style: const TextStyle(
                              fontSize: 16,
                              color: kTextColor,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ), 
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
                    child: GestureDetector(
                        onTap: () async {
                          Map formData = {
                            'customerId': _authController.user.id,
                            'orderId': orders[index].id
                          };
                          bool checkUpdate = await _ordersController.updateOrder(formData: formData);
                          if(checkUpdate){
                            Get.toNamed('/evaluation', arguments: orders[index]);
                          }else{
                            Get.snackbar(
                              "orders_screen_update_error_title".tr, 
                              "orders_screen_update_error_message".tr,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: kPrimaryColor,
                              colorText: Colors.white
                            );
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              width: getScreenSize(context) * 4.0,
                              height: getScreenSize(context) * 4.0,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.circular(50)),
                              child: const Padding(
                                padding: EdgeInsets.all(
                                    kDefaultPadding / 2),
                                child: Icon(Icons.check, color: Colors.white),
                              ),
                            ),
                            Text(
                              "orders_screen_done".tr,
                              style: const TextStyle(
                                fontSize: 16,
                                color: kTextColor
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                  Divider(color: kTextColor.withOpacity(0.2)),
                ],
              ))),
          )
        )
      );
  }
}
