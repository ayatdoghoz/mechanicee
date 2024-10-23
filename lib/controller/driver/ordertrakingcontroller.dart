import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/services/services.dart';

import '../../core/functions/decodepolyline.dart';

class OrderTrakingController extends GetxController {
  MyServices myServices = Get.find();
  String? requestid;
  List<Marker> marker = [];
  String? currentlat;
  String? currentlong;
  String? m_lat;
  String? m_long;
  StatusRequest statusRequest = StatusRequest.none;
  Position? position;
  CameraPosition? kGooglePlex;
  GoogleMapController? completerController;
  Set<Polyline> polylineset = {};

  initialData() {
    currentlat = myServices.sharedPreferences.getString("lat");
    currentlong = myServices.sharedPreferences.getString("long");
    kGooglePlex = CameraPosition(
        zoom: 10,
        target: LatLng(double.parse(currentlat!), double.parse(currentlong!)));

    marker.add(Marker(
        markerId: MarkerId("driver"),
        position:
            LatLng(double.parse(currentlat!), double.parse(currentlong!))));
  }

  getOrderLocation() {
    FirebaseFirestore.instance
        .collection("mechanice")
        .doc("6")
        .snapshots()
        .listen((event) {
      if (event.exists) {
        m_lat = event.get("lat");
        m_long = event.get("long");
        updateMarker(double.parse(m_lat!), double.parse(m_long!));
      }
    });
  }

  updateMarker(double newlat, double newlong) {
    marker.removeWhere((element) => element.markerId.value == "dest");

    marker.add(
        Marker(markerId: MarkerId("dest"), position: LatLng(newlat, newlong)));

    update();
  }

  initPolyLine() async {
    await Future.delayed(Duration(seconds: 1));
    polylineset = await getPolyline(currentlat, currentlong, m_lat, m_long);
    update();
  }

  @override
  void onClose() {
    completerController!.dispose();

    super.onClose();
  }

  @override
  void onInit() {
    initialData();
    requestid = Get.arguments['requestid'];
    getOrderLocation();
    initPolyLine();
    super.onInit();
  }
}
