import 'dart:async';
import 'dart:ffi';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/services/services.dart';

class LocationController extends GetxController {
  MyServices myServices = Get.find();
  List<Marker> marker = [];
  double? lat;
  double? long;
  StatusRequest statusRequest = StatusRequest.looding;
  Position? position;
  CameraPosition? kGooglePlex;

  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();

  getCurentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 12);
    statusRequest = StatusRequest.none;
    update();
  }

  backToAddInfo() {
    myServices.sharedPreferences.setString("lat", lat.toString());
    myServices.sharedPreferences.setString("long", long.toString());
    Get.back();
    print("lat=:$lat and long = $long");
  }

  addMarkers(LatLng latLng) {
    marker.clear();
    marker.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  void onInit() {
    getCurentLocation();
    super.onInit();
  }
}
