import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:mechanice/core/functions/handelingdata.dart';
import 'package:mechanice/core/services/services.dart';
import 'package:mechanice/data/datasource/remote/d-categorydata.dart';

abstract class CategoryController extends GetxController {
  initialData();
  getdata();
  goToItems(String id);
  goToBot();
}

class CategoryControllerImp extends CategoryController {
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
    FirebaseMessaging.instance.subscribeToTopic("users");
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
  goToItems(id) {
    Get.toNamed("servicetype", arguments: {"category_id": id});
  }

  @override
  goToBot() {
    Get.toNamed("bot");
  }
}
















// abstract class CategoryController extends GetxController {
//   initiaData();
//   getData();
//   gotolist(List category, int selectedcat, String catid);
// }

// class CategoryControllerImp extends CategoryController {
//   MyServices myServices = Get.find();
//   String? id;
//   String? username;
//   CategoryData categoryData = CategoryData(Get.find());
//   List data = [];
//   late StatusRequest statusRequest = StatusRequest.none;
//   @override
//   initiaData() {
//     id = myServices.sharedPreferences.getString("id");
//     username = myServices.sharedPreferences.getString('username');
//   }

//   @override
//   void onInit() {
//     initiaData();
//     getData();

//     super.onInit();
//   }

//   @override
//   getData() async {
//     statusRequest = StatusRequest.looding;
//     var response = await categoryData.getData();
//     print("=============================== Controller $response ");
//     statusRequest = handelingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   gotolist(category, selectedcat, catid) {
//     Get.offNamed("Onwayservice", arguments: {
//       "category": category,
//       "selectedcat ": selectedcat,
//       "catid": catid,
//     });
//   }
// }
