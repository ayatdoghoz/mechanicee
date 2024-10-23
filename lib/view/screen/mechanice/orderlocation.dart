import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/controller/mechanice/orderlocationcontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/core/functions/decodepolyline.dart';

import '../../../constant/constant.dart';

class OrderLocation extends StatelessWidget {
  const OrderLocation({super.key});

  @override
  Widget build(BuildContext context) {
    OrderLocationController controller = Get.put(OrderLocationController());
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
        body: GetBuilder<OrderLocationController>(
            builder: (controllerPage) => HandelingDataView(
                  statusRequest: controllerPage.statusRequest,
                  widget: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (controllerPage.kGooglePlex != null)
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: GoogleMap(
                            markers: controllerPage.marker.toSet(),
                            mapType: MapType.normal,
                            polylines: controller.polylineset,
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
