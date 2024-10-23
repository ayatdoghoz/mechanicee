import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/functions/decodepolyline.dart';
import '../../data/datasource/remote/d-onwaydata.dart';
import '../../data/model/store.dart';

class MapController extends GetxController {
  final markerColor = orangeColor;

  String? category_id;
  String? onWay;
  MyServices myServices = Get.find();
  List<Marker> markers = [];
  double? currentlat;
  double? currentlong;
  StatusRequest statusRequest = StatusRequest.none;
  Position? position;
  CameraPosition? kGooglePlex;
  GoogleMapController? completerController;
  Set<Polyline> polylineset = {};
  OnWayData onWayData = OnWayData(Get.find());
  List<StoreModel> data = [];
  List<Map<String, String>> storeLocations = [];
  StreamSubscription<Position>? positionStream;

  @override
  getItems(category_id, onWay) async {
    data.clear();
    statusRequest = StatusRequest.looding;
    var response = await onWayData.getData(category_id, onWay);
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        for (var store in response["data"]) {
          String latitude = store['address_lat'];
          String longitude = store['address_long'];
          String name = store['storename'];
          String phone = store['storephone'];
          String start = store['start'];
          String end = store['end'];
          String owner_name = store['owner_name'];

          Map<String, String> location = {
            'latitude': latitude,
            'longitude': longitude,
            'storename': name,
            'storephone': phone,
            'start': start,
            'end': end,
            'owner_name': owner_name,
          };

          storeLocations.add(location);
        }
        addMarkers();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  initPolyLine(double m_lat, double m_long) async {
    await Future.delayed(Duration(seconds: 1));
    polylineset = await getPolyline(currentlat, currentlong, m_lat, m_long);

    update();
  }

  void addMarkers() {
    for (var i = 0; i < storeLocations.length; i++) {
      final markerLocation = storeLocations[i];

      double latitude = double.parse(markerLocation['latitude']!);
      double longitude = double.parse(markerLocation['longitude']!);

      markers.add(Marker(
        onTap: () {
          initPolyLine(latitude, longitude);
        },
        markerId: MarkerId('${latitude}_${longitude}'),
        position: LatLng(latitude, longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(
            snippet: markerLocation['owner_name'],
            title: markerLocation['storename'],
            onTap: () {
              Get.bottomSheet(
                Container(
                  height: 235,
                  width: double.infinity,
                  color: blackColor,
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'اسم المحل',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: orangeColor),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${markerLocation['storename']}",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'رقم الهاتف',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: orangeColor),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(
                              Uri.parse("tel:${markerLocation['storephone']}"));
                        },
                        child: Text(
                          "${markerLocation['storephone']}'",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                'نهاية الدوام',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: orangeColor),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${markerLocation['end']}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Column(
                            children: [
                              Text(
                                'بداية الدوام',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: orangeColor),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${markerLocation['start']}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
              );
            }),
      ));
    }
  }

  initialData() {
    markers.removeWhere((element) => element.markerId.value == "current");
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print(position!.latitude);
      print("=======================");
      currentlat = position.latitude;
      currentlong = position.longitude;
      kGooglePlex =
          CameraPosition(zoom: 10, target: LatLng(currentlat!, currentlong!));
      if (completerController != null) {
        completerController!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
      }
      markers.add(Marker(
          markerId: MarkerId("current"),
          position: LatLng(currentlat!, currentlong!)));

      update();
    });
  }

  @override
  void onClose() {
    positionStream!.cancel();
    completerController!.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    category_id = Get.arguments['category_id'];
    onWay = Get.arguments['onWay'];
    initialData();
    getItems(category_id!, onWay!);

    super.onInit();
  }
}
