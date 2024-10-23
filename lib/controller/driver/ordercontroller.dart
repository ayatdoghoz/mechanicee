import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/orderstatus.dart';
import 'package:mechanice/data/model/request.dart';

class OrderControllerImp extends GetxController {
  OrderStatusData requestData = OrderStatusData(Get.find());
  MyServices myServices = Get.find();
  String? status;
  String? mid;
  String? requestid;
  late String type;

  List<requestModel> data = [];
  late StatusRequest statusRequest;

  printOrderStatus(String val) {
    if (val == "0") {
      return "بانتطار الموافقة على الطلب   ";
    } else if (val == "1") {
      return "تمت الموافقة على الطلب";
    } else if (val == "2") {
      return "تمت الخدمة بنجاح";
    }
  }

  getData() async {
    data.clear();
    statusRequest = StatusRequest.looding;
    update();
    var response = await requestData.getData(requestid!);
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => requestModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  finish(String id) async {
    data.clear();
    statusRequest = StatusRequest.looding;
    update();
    var response = await requestData.finish(id, requestid!);
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
      } else {}
    }
    update();
  }

  refrehOrder() {
    getData();
  }

  tracking() {
    Get.toNamed("ordertraking", arguments: {"requestid": requestid});
  }

  @override
  void onInit() {
    type = Get.arguments["paymentmethod"];
    requestid = Get.arguments["request_id"];
    getData();
    super.onInit();
  }
}
