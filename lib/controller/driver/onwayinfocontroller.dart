import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';

import 'package:mechanice/data/datasource/remote/d-onwaydata.dart';
import 'package:mechanice/data/model/store.dart';

import '../../core/services/services.dart';

abstract class OnWayInfoController extends GetxController {
  intialData();
  getItems(String category_id, String onWay);
  goToAllInfo(StoreModel onWay);
}

class OnWayInfoControllerImp extends OnWayInfoController {
  double? distance;

  String? category_id;
  String? onWay;
  MyServices myServices = Get.find();
  var response;

  List<Map<String, String>> storeLocations = [];

  OnWayData onWayData = OnWayData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    intialData();

    super.onInit();
  }

  @override
  intialData() {
    category_id = Get.arguments['category_id'];
    onWay = Get.arguments['onWay'];
    getItems(category_id!, onWay!);
  }

  @override
  getItems(category_id, onWay) async {
    data.clear();
    statusRequest = StatusRequest.looding;
    response = await onWayData.getData(category_id, onWay);
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        // for (var store in response["data"]) {
        //   String latitude = store['address_lat'];
        //   String longitude = store['address_long'];
        //   Map<String, String> location = {
        //     'latitude': latitude,
        //     'longitude': longitude,
        //   };

        //   storeLocations.add(location);
        // }
        // getdistance();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  goToAllInfo(onWay) {
    Get.toNamed("Allinfo", arguments: {"onWay": onWay});
  }

  // getdistance() async {
  //   for (var i = 0; i < storeLocations.length; i++) {
  //     final markerLocation = storeLocations[i];

  //     double latitude = double.parse(markerLocation['latitude']!);
  //     double longitude = double.parse(markerLocation['longitude']!);

  //     distance = Geolocator.distanceBetween(
  //         double.parse(myServices.sharedPreferences.getString("lat")!),
  //         double.parse(myServices.sharedPreferences.getString("lat")!),
  //         latitude,
  //         longitude);
  //     print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
  //     print(distance);
  //   }
  // }
}
