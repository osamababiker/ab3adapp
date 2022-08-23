import 'package:ab3ad/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controllers/ordersController.dart';
import '../../../size_config.dart';
import '../../../utils/.env.dart';


class Body extends StatelessWidget {
  
  Body({Key? key}) : super(key: key);
  final OrdersController _ordersController = 
  Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    if(_ordersController.ordersList.isNotEmpty){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, 
          child: Column(
            children: List.generate(_ordersController.ordersList.length,
              (index) => Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( 
                          "delivery_screen_customer_details".tr,
                          style: const TextStyle(fontSize: 16, color: kTextColor),
                        ),
                        const SizedBox(height: kDefaultPadding / 2),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.person),
                                const SizedBox(width: kDefaultPadding / 4),
                                Text(
                                  _ordersController.ordersList[index].user.name,
                                  style: const TextStyle(fontSize: 16, color: kTextColor),
                                ),
                              ],
                            ),
                            const SizedBox(width: kDefaultPadding / 4),
                            Row(
                              children: [
                                const Icon(Icons.phone),
                                const SizedBox(width: kDefaultPadding / 4),
                                  Text(
                                  _ordersController.ordersList[index].user.phone,
                                  style: const TextStyle(fontSize: 16, color: kTextColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(color: kTextColor.withOpacity(0.5)),
                        Text(
                          "delivery_screen_order_details".tr,
                          style: const TextStyle(fontSize: 16, color: kTextColor),
                        ),
                        const SizedBox(height: kDefaultPadding / 2),
                        Padding(
                          padding: const EdgeInsets.all(kDefaultPadding / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                SizedBox(
                                  width: getScreenSize(context) * 8.0,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: getScreenSize(context) * 4.0,
                                        height: getScreenSize(context) * 4.0,
                                        child: FadeInImage.assetNetwork(
                                          imageErrorBuilder: (context, error, stackTrace) {
                                            return Image.asset(
                                              "assets/images/liquid-loader.gif",
                                            );
                                          },
                                          placeholder: "assets/images/liquid-loader.gif",
                                          image: "$uploadUri/items/${_ordersController.ordersList[index].item.image}"
                                        )
                                      ), 
                                      const VerticalSpacing(of: 1.0),
                                      Text(
                                        _ordersController.ordersList[index].item.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: kTextColor
                                        ),
                                      ),
                                      const VerticalSpacing(of: 1.0),
                                      Text(
                                        "delivery_screen_delivery_time".tr,
                                        style: const TextStyle(fontSize: 16, color: kTextColor),
                                      ),
                                      Text(
                                        _ordersController.ordersList[index].delivaryTime,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                            fontSize: 16,
                                            color: kTextColor
                                        )
                                      ),
                                      const VerticalSpacing(of: 1.0),
                                      Text(
                                        _ordersController.ordersList[index].notes,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: kTextColor
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "delivery_screen_quantity".tr,
                                  style: const TextStyle(fontSize: 16, color: kTextColor),
                                ),
                                SizedBox(width: getScreenSize(context) * 2.0),
                                Text(
                                  "${_ordersController.ordersList[index].quantity}",
                                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                ),
                              ]),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/takeOrder', arguments: _ordersController.ordersList[index]);
                                },
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
                                        "assets/icons/Location_point.svg",
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ), 
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                ],
              )),
          ),
        ),
      );
      }else {
        return Center(
          child: Text(
            "delivery_screen_no_orders".tr,
            style: const TextStyle(
              fontSize: 18
            ),
          ),
      );
    }
  }
}
