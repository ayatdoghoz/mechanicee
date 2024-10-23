import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/request.dart';
import 'package:mechanice/data/model/request.dart';

class PreOrderController extends GetxController {
  RequestData requestData = RequestData(Get.find());
  MyServices myServices = Get.find();

  late String name;
  List<requestModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.looding;
    update();
    var response = await requestData
        .getPreOrder(myServices.sharedPreferences.getString("id").toString());
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => requestModel.fromJson(e)));
      } else {
        ;
      }
    }
    update();
  }

  refrehOrder() {
    getData();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
