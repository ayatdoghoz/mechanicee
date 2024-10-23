import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/d_location.dart';

class DLocationController extends GetxController {
  MyServices myServices = Get.find();
  List<Marker> marker = [];
  double? lat;
  double? long;
  StatusRequest statusRequest = StatusRequest.looding;
  Position? position;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();
  String? category_id;
  String? onWay;
  getCurentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    kGooglePlex = CameraPosition(
        zoom: 12, target: LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  goToNextPage() async {
    myServices.sharedPreferences.setString("lat", lat.toString());
    myServices.sharedPreferences.setString("long", long.toString());
    print(lat);

    Get.toNamed('Onwayservice',
        arguments: {"onWay": onWay, "category_id": category_id});
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
    category_id = Get.arguments['category_id'];
    onWay = Get.arguments['onWay'];

    getCurentLocation();
    super.onInit();
  }
}
