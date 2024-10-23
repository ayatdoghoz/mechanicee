import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/services/services.dart';

import '../../core/functions/decodepolyline.dart';

class OrderLocationController extends GetxController {
  late String request_id;
  late String d_lat;
  late String d_long;
  StreamSubscription<Position>? positionStream;
  Timer? timer;
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
        zoom: 10, target: LatLng(double.parse(d_lat), double.parse(d_long)));

    marker.add(Marker(
        markerId: MarkerId("driver"),
        position: LatLng(double.parse(d_lat), double.parse(d_long))));
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
    polylineset = await getPolyline(currentlat, currentlong, d_lat, d_long);
    update();
  }

  refreshLocation() async {
    await Future.delayed(Duration(seconds: 1));
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      FirebaseFirestore.instance.collection("mechanice").doc(request_id).set({
        "lat": currentlat.toString(),
        "long": currentlong.toString(),
        "m_id": myServices.sharedPreferences.getString("id")
      });
    });
  }

  @override
  void onClose() {
    positionStream!.cancel();
    completerController!.dispose();
    timer!.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    request_id = Get.arguments["request_id"];
    d_lat = Get.arguments["d_lat"];
    d_long = Get.arguments["d_long"];

    initialData();
    refreshLocation();
    initPolyLine();
    super.onInit();
  }
}
