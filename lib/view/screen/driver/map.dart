import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/controller/driver/mapcontroller.dart';
import 'package:mechanice/controller/mechanice/orderlocationcontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/core/functions/decodepolyline.dart';

import '../../../constant/constant.dart';
import '../../../controller/driver/ordertrakingcontroller.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          centerTitle: true,
          title: Text(
            "ميكانيكي",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        body: GetBuilder<MapController>(
            builder: (controllerPage) => HandelingDataView(
                  statusRequest: controllerPage.statusRequest,
                  widget: Column(
                    children: [
                      if (controllerPage.kGooglePlex != null)
                        Expanded(
                          child: GoogleMap(
                            polylines: controller.polylineset,
                            markers: controllerPage.markers.toSet(),
                            mapType: MapType.normal,
                            initialCameraPosition: controller.kGooglePlex!,
                            onMapCreated: (GoogleMapController controllerMap) {
                              controller.completerController = controllerMap;
                            },
                          ),
                        ),
                    ],
                  ),
                )));
  }
}
