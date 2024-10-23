// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mechanicee/controller/test.dart';
// import 'package:mechanicee/core/class/hanelingdataview.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());
//     return Scaffold(body: GetBuilder<TestController>(builder: (controller) {
//       return HandelingDataView(
//           statusRequest: controller.statusRequest,
//           widget: ListView.builder(
//               itemCount: controller.data.length,
//               itemBuilder: (context, index) {
//                 return Text("${controller.data}");
//               }));
//     }));
//   }
// }
