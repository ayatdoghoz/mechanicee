import 'dart:convert';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:http/http.dart" as http;
import 'package:mechanice/constant/constant.dart';

String key = "AIzaSyDIHVFxaBIvlHKZbmHccVuldRhUXldtmNg";

Future getPolyline(lat, long, destlat, destlong) async {
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineset = {};

  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=$key";
  var response = await http.post(Uri.parse(url));
  var responsebody = jsonDecode(response.body);
  print("^^^^^^^^^^^^^^^^^^^^^^^^^^^");
  print(responsebody);

  // التأكد من وجود بيانات الاتجاهات وأنها غير فارغة
  if (responsebody['routes'] != null && responsebody['routes'].isNotEmpty) {
    var routes = responsebody['routes'] as List;

    // التأكد من وجود بيانات النقاط الرئيسية للخطوط المتعرجة
    if (routes[0]['overview_polyline'] != null &&
        routes[0]['overview_polyline']['points'] != null) {
      var point = routes[0]['overview_polyline']['points'];
      List<PointLatLng> result = polylinePoints.decodePolyline(point);
      if (result.isNotEmpty) {
        result.forEach((PointLatLng pointLatLng) {
          polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
        });
      }
      Polyline polyline = Polyline(
        polylineId: PolylineId("line"),
        color: orangeColor,
        width: 5,
        points: polylineco,
      );
      polylineset.add(polyline);
    }
  }

  return polylineset;
}
