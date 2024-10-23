import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/d-categorydata.dart';

abstract class ServiceTypeController extends GetxController {
  initialData();
  getdata();
  goToAddInfo(String category_id);
}

class ServiceTypeControllerImp extends ServiceTypeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  CategoryData categoryData = CategoryData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.looding;
    var response = await categoryData.getData();
    print("=============================== Controller $response ");
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToAddInfo(category_id) {
    Get.toNamed("addinfo", arguments: {"category_id": category_id});
    print("========================");
    print(category_id);
  }
}
