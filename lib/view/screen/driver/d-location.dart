import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/view/widget/button.dart';

import '../../../constant/constant.dart';
import '../../../controller/driver/d-locationcontroller.dart';

class DLocationPage extends StatelessWidget {
  const DLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DLocationController controller = Get.put(DLocationController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
          "ميكانيكي",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<DLocationController>(
        builder: (controllerPage) => HandelingDataView(
          statusRequest: controllerPage.statusRequest,
          widget: Stack(
            alignment: Alignment.center,
            children: [
              if (controllerPage.kGooglePlex != null)
                GoogleMap(
                  onTap: (latlong) {
                    controllerPage.addMarkers(latlong);
                  },
                  markers: controllerPage.marker.toSet(),
                  mapType: MapType.normal,
                  initialCameraPosition: controller.kGooglePlex!,
                  onMapCreated: (GoogleMapController controllerMap) {
                    controller.completerController.complete(controllerMap);
                  },
                ),
              Positioned(
                bottom: 20,
                child: Button(
                  size: 20,
                  hight: 50,
                  width: 200,
                  text: "حفظ الموقع",
                  onTap: () {
                    if (controllerPage.lat == null ||
                        controllerPage.long == null) {
                      Get.defaultDialog(
                          title: "تنبيه", middleText: 'يرحى  تحديد الموقع');
                    } else {
                      controllerPage.goToNextPage();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
