import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/services/services.dart';

import '../../core/functions/decodepolyline.dart';

class StoreLocationController extends GetxController {
  late String m_lat;
  late String m_long;
  StreamSubscription<Position>? positionStream;

  MyServices myServices = Get.find();
  List<Marker> marker = [];
  double? currentlat;
  double? currentlong;
  StatusRequest statusRequest = StatusRequest.none;
  Position? position;
  CameraPosition? kGooglePlex;
  GoogleMapController? completerController;
  Set<Polyline> polylineset = {};

  initialData() {
    kGooglePlex = CameraPosition(
        zoom: 10, target: LatLng(double.parse(m_lat), double.parse(m_long)));

    marker.add(Marker(
        markerId: MarkerId("mechanice"),
        position: LatLng(double.parse(m_lat), double.parse(m_long))));
    marker.removeWhere((element) => element.markerId.value == "current");
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print(position!.latitude);
      print("=======================");
      currentlat = position.latitude;
      currentlong = position.longitude;
      if (completerController != null) {
        completerController!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
      }
      marker.add(Marker(
          markerId: MarkerId("current"),
          position: LatLng(currentlat!, currentlong!)));

      update();
    });
  }

  initPolyLine() async {
    await Future.delayed(Duration(seconds: 1));
    polylineset = await getPolyline(currentlat, currentlong, m_lat, m_long);

    update();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    completerController!.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    m_lat = Get.arguments["lat"];
    m_long = Get.arguments["long"];

    initialData();

    initPolyLine();
    super.onInit();
  }
}
