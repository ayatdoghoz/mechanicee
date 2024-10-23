import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/controller/mechanice/orderlocationcontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/core/functions/decodepolyline.dart';

import '../../../constant/constant.dart';
import '../../../controller/driver/ordertrakingcontroller.dart';

class OrderTraking extends StatelessWidget {
  const OrderTraking({super.key});

  @override
  Widget build(BuildContext context) {
    OrderTrakingController controller = Get.put(OrderTrakingController());
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
        body: GetBuilder<OrderTrakingController>(
            builder: (controllerPage) => HandelingDataView(
                  statusRequest: controllerPage.statusRequest,
                  widget: Column(
                    children: [
                      if (controllerPage.kGooglePlex != null)
                        Expanded(
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
