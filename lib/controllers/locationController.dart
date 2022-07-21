import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';

class LocationControler extends GetxController {
  var isLoading = true.obs;
  var lat = 0.0.obs;
  var lng = 0.0.obs;
  var address = ''.obs;

  Completer<GoogleMapController> mapController = Completer();
  Map<MarkerId, Marker> markers = {};
  late StreamSubscription<Position> streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getLocation(); 
    setMarkers();
  }

  Future getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location Services is disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Locaion permission are permanetly denied , we cannot request permissions');
    }

    // to get user location
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      lat.value = position.latitude;
      lng.value = position.longitude;
      getAddressFromLatLng(position);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.locality}, ${place.country}';
  }

  Future setMarkers() async {
    addMarker(
        LatLng(lat.value, lng.value), "موقعك", BitmapDescriptor.defaultMarker);
  }

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
    return markers;
  }
 
  Future<List<Location>> getCoordinates({required String address}) async {
    List<Location> locations = await locationFromAddress(address);
    print(locations);
    return locations;
  }

  Future<List<Placemark>> getAddress(
      {required double lat, required double lng}) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);
    return placemarks;
  }
}