// import 'package:get/get.dart';
// import 'package:mechanicee/core/class/statusrequest.dart';
// import 'package:mechanicee/core/functions/handelingdata.dart';
// import 'package:mechanicee/data/datasource/remote/test.dart';

// class TestController extends GetxController {
//   TestData testdata = TestData(Get.find());
//   List data = [];
//   late StatusRequest statusRequest;
//   getData() async {
//     statusRequest = StatusRequest.looding;
//     var response = await testdata.getData();
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
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }
