import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import '../../../constant/constant.dart';
import '../../../controller/driver/storelocationcontroller.dart';

class StoreLocation extends StatelessWidget {
  const StoreLocation({super.key});

  @override
  Widget build(BuildContext context) {
    StoreLocationController controller = Get.put(StoreLocationController());
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
        body: GetBuilder<StoreLocationController>(
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
