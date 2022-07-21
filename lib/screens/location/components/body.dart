
import 'package:ab3ad/controllers/locationController.dart';
import 'package:ab3ad/screens/components/default_button.dart';
import 'package:ab3ad/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {

  Body({Key? key}) : super(key: key);
  final LocationControler _locationControler = 
  Get.find<LocationControler>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: getScreenSize(context) * 50.0,
            child: GoogleMap(
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
                      onSubmitted: (value) async {},
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
                      press: () async {}
                    )
                  ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
