import 'package:ab3ad/constants.dart';
import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/controllers/ordersController.dart';
import 'package:ab3ad/models/deliveryRequest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/driversController.dart';
import '../../../size_config.dart';
import '../../../utils/.env.dart';

class Body extends StatelessWidget {
  
  Body({Key? key, required this.requestsList}) : super(key: key);
  final DriversController _driversController = 
  Get.find<DriversController>();
  final OrdersController _ordersController = 
  Get.find<OrdersController>();
  final AuthController _authController = 
  Get.find<AuthController>();
  final List<DeliveryRequest> requestsList ;
  
  @override
  Widget build(BuildContext context) {
    if(requestsList.isNotEmpty){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Column(
          children: List.generate(requestsList.length,(index) => Column(
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
                        "delivery_requests_customer_details".tr,
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
                                requestsList[index].customer.name,
                                style: const TextStyle(
                                    fontSize: 16, color: kTextColor),
                              ),
                            ],
                          ),
                          const SizedBox(width: kDefaultPadding / 4),
                          Row(
                            children: [
                              const Icon(Icons.phone),
                              const SizedBox(width: kDefaultPadding / 4),
                              Text(
                                requestsList[index].customer.phone,
                                style: const TextStyle(fontSize: 16, color: kTextColor),
                              ),
                            ],
                          ), 
                        ],
                      ),
                      Divider(color: kTextColor.withOpacity(0.5)),
                      Text(
                        "delivery_requests_order_details".tr,
                        style: const TextStyle(fontSize: 16, color: kTextColor),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding / 2),
                        child: FutureBuilder( 
                          future: _ordersController.fetchSingleOrder( 
                            orderId: requestsList[index].orderId
                          ), 
                          builder: (context, AsyncSnapshot snapshot) {
                            if(snapshot.hasData){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                    SizedBox(
                                      width: getScreenSize(context) * 8.0,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: getScreenSize(context) * 4.0,
                                            height: getScreenSize(context) * 4.0,
                                            child: CachedNetworkImage(
                                              imageUrl: "$uploadUri/items/${snapshot.data.item.image}",
                                              placeholder: (context, url) => Image.asset("assets/images/liquid-loader.gif"),
                                              errorWidget: (context, url, error) => Image.asset("assets/images/liquid-loader.gif"),
                                            )
                                          ),
                                          const VerticalSpacing(of: 1.0),
                                          Text(
                                            snapshot.data.item.name,
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
                                            snapshot.data.delivaryTime,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: kTextColor
                                            ),
                                          ),
                                          const VerticalSpacing(of: 1.0),
                                          Text(
                                            snapshot.data.notes,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: kTextColor
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "delivery_requests_quantity".tr,
                                      style: const TextStyle(fontSize: 16,color: kTextColor)
                                    ),
                                    SizedBox(width: getScreenSize(context) * 2.0),
                                    Text(
                                      "${snapshot.data.quantity}",
                                      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                    ),
                                  ]
                                    
                                  ),
                                  requestsList[index].isAccepted == 1  && snapshot.data.status != 2 ?
                                  GestureDetector(
                                    onTap: () async {
                                      Map formData = {
                                        'orderId': snapshot.data.id,
                                        'driverId': _authController.user.id
                                      };
                                      bool checkComplete = await _driversController.orderCompleteSign(formData: formData);
                                      if(checkComplete){
                                        Get.toNamed('/evaluation', arguments: snapshot.data);
                                      }
                                    },
                                    child: Container(
                                      width: getScreenSize(context) * 4.0,
                                      height: getScreenSize(context) * 4.0,
                                      decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.circular(50)
                                        ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(kDefaultPadding / 2),
                                        child: Icon(Icons.check, color: Colors.white),
                                      ),
                                    ),
                                  ) : const Text("")
                                ]
                              );
                            }else {
                              return const Center(  
                                child: CircularProgressIndicator(backgroundColor: kPrimaryColor, color: Colors.white,),
                              );
                            }
                          }
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2),
              ],
            )
          ),
        ),
      ),
    );
    }else{
      return Center(
        child: Text(
          "delivery_requests_no_requests".tr,
          style: const TextStyle(
            fontSize: 18
          ),
        ),
      );
    }
  }
}
