import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/d-orderdata.dart';
import 'package:mechanice/data/model/request.dart';
import 'package:mechanice/data/model/store.dart';

abstract class AllInfoController extends GetxController {
  initialData();
  location(String lat, String long);
  order();
  payment(String paymenttype);
  getPrice();
}

class AllInfoControllerImp extends AllInfoController {
  late StoreModel onWay;
  double? distance;
  OrderData orderData = OrderData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late String mid;
  late String type;
  late String dlat;
  late String dlong;
  String? price;
  String? requestid;
  List<requestModel> data = [];
  @override
  initialData() {
    onWay = Get.arguments['onWay'];
    mid = onWay.mId.toString();
    dlat = myServices.sharedPreferences.getString("lat")!;
    dlong = myServices.sharedPreferences.getString("long")!;
  }

  @override
  location(lat, long) {
    Get.toNamed("storelocation", arguments: {
      "lat": lat,
      "long": long,
    });
  }

  @override
  getPrice() {
    distance = Geolocator.distanceBetween(
        double.parse(dlat),
        double.parse(dlong),
        double.parse(onWay.address_lat!),
        double.parse(onWay.address_long!));
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    print(distance);
  }

  @override
  order() async {
    statusRequest = StatusRequest.looding;
    var response = await orderData.getData(
        myServices.sharedPreferences.getString('id')!,
        mid,
        type,
        dlat,
        dlong,
        price = "${((distance! / 1000) * 2000).floor()} sp");
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var Data = response['data'][0];
        // myServices.sharedPreferences
        //     .setString("request_id", Data['request_id'].toString());
        requestid = Data['request_id'].toString();
        Get.offNamed("order",
            arguments: {"paymentmethod": type, "request_id": requestid});
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  payment(paymenttype) {
    type = paymenttype;
  }

  @override
  void onInit() {
    initialData();
    getPrice();
    super.onInit();
  }
}
