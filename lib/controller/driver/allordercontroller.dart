import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/d-allorder.dart';
import 'package:mechanice/data/model/request.dart';

class AllOrderController extends GetxController {
  AllOrderData Data = AllOrderData(Get.find());
  MyServices myServices = Get.find();
  late String status;
  List<requestModel> data = [];
  late StatusRequest statusRequest;
  printOrderStatus(String val) {
    if (val == "0") {
      return "بانتظار الموافقة";
    } else {
      return "تمت الموافقة";
    }
  }

  printPaymentMethod(String val) {
    if (val == "0") {
      return "كاش";
    } else {
      return "دفع الكتروني";
    }
  }

  getData() async {
    // data.clear();
    statusRequest = StatusRequest.looding;
    update();
    var response =
        await Data.getData(myServices.sharedPreferences.getString("id")!);
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

  deletData(request_id) async {
    data.clear();
    statusRequest = StatusRequest.looding;
    update();
    var response = await Data.deleteOrder(request_id.toString()
        // myServices.sharedPreferences.getString("request_id")!
        );
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refrehOrder() {
    getData();
  }

  // tracking() {
  //   Get.toNamed("ordertraking", arguments: {
  //     "requestid": myServices.sharedPreferences.getString("request_id")
  //   });
  // }
  goToOrderInfo(String type, String request_id) {
    Get.toNamed("order",
        arguments: {"paymentmethod": type, "request_id": request_id});
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
