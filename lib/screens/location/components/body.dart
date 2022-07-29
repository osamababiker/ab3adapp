
import 'dart:convert';

import 'package:ab3ad/controllers/authController.dart';
import 'package:ab3ad/controllers/cartController.dart';
import 'package:ab3ad/controllers/locationController.dart';
import 'package:ab3ad/controllers/ordersController.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../constants.dart';
import 'package:path/path.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {

  Body({Key? key}) : super(key: key);
  final LocationControler _locationControler = 
  Get.find<LocationControler>();
  final CartDbController _cartController = 
  Get.find<CartDbController>();
  final OrdersController _ordersController = 
  Get.find<OrdersController>();
  final AuthController _authController = 
  Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => SizedBox(
        width: size.width,
        height: size.height * 0.8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: _locationControler.isLoading.value  ?
                Center(
                  child: SizedBox(
                    width: getScreenSize(context) * 4.0,
                    height: getScreenSize(context) * 4.0,
                    child: const CircularProgressIndicator(backgroundColor: kPrimaryColor, color: Colors.white)
                  ),
                ) 
                : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(_locationControler.lat.value, _locationControler.lng.value),
                  zoom: _locationControler.zoom.value
                ),
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
                onMapCreated: (GoogleMapController controller){
                  _locationControler.mapController.complete(controller);
                },
                mapToolbarEnabled: true,
                markers: Set<Marker>.of(_locationControler.markers.values),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        onSubmitted: (value) async {
                          _locationControler.getCoordinates(address: value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "location_screen_search_location_hint".tr,
                          hintStyle: const TextStyle(color: kTextColor, fontSize: 14),
                          contentPadding: const EdgeInsets.all(kDefaultPadding),
                        )
                      ),
                      const SizedBox(height: 5),
                      DefaultButton(
                        text: "location_screen_send_order_btn".tr,
                        press: () async {
                          List cartList = await _cartController.getItems();
                          if(cartList.isEmpty){
                            Get.snackbar(
                              "location_screen_cart_empty_error_title".tr,
                              "location_screen_cart_empty_error_message".tr,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: kPrimaryLightColor
                            );
                          }else {
                            var _itemFile;
                            for (var i = 0; i < cartList.length; i++) {
                              var cartMap = cartList[i].toMap();
                              if(cartMap['uploadedImage'] != null){
                                _itemFile = MultipartFile(
                                  cartMap['uploadedImage'],
                                  filename: basename(cartMap['uploadedImage']),
                                );
                            }
                            var formData = FormData({
                              'userId': _authController.user.id,
                              'cart': jsonEncode(cartMap),
                              'lat': _locationControler.lat.value,
                              'lng': _locationControler.lng.value,
                              'file': _itemFile,
                              'status': 0
                            });
                            await _ordersController.sendOrder(formData: formData);
                            await _cartController.deleteItem(cartList[i].id);
                            Get.toNamed('/orderComplete');
                          }
                        }
                      })
                    ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
