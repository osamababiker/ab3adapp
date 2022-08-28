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
  var zoom = 19.151926040649414.obs;

  Completer<GoogleMapController> mapController = Completer();
  late Map<MarkerId, Marker> markers = {};
  late StreamSubscription<Position> streamSubscription;

  @override
  void onInit() { 
    super.onInit();
    setMarkers();
  }

  Future setMarkers() async {
    isLoading(true);
    await getLocation(); 
    addMarker(LatLng(lat.value, lng.value), "موقعك", BitmapDescriptor.defaultMarker);
    isLoading(false);
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
      return Future.error('Locaion permission are permanetly denied , we cannot request permissions');
    }

    // to get user location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat.value = position.latitude;
    lng.value = position.longitude;
    getAddressFromPosition(position);
  }

  Future<void> getAddressFromPosition(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.locality}, ${place.country}';
  }

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
    return markers;
  }
 
  Future<List<Location>> getCoordinates({required String address}) async {
    isLoading(true);
    List<Location> locations = await locationFromAddress(address);
    lat.value = locations[0].latitude;
    lng.value = locations[0].longitude;
    addMarker(LatLng(lat.value, lng.value), "موقعك", BitmapDescriptor.defaultMarker);
    isLoading(false);
    return locations;
  }

  Future<String> getAddress({required double customerLat, required double customerLng}) async {
    isLoading(true);
    lat.value = customerLat;
    lng.value = customerLng;
    addMarker(LatLng(lat.value, lng.value), "موقعك", BitmapDescriptor.defaultMarker);
    List<Placemark> placemarks = await placemarkFromCoordinates(customerLat, customerLng);
    isLoading(false);
    Placemark placeMark  = placemarks[0];
    return "${placeMark.name} / ${placeMark.locality} /  ${placeMark.country}";
  }
}