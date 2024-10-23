import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/allordercontroller.dart';
import 'package:mechanice/controller/driver/ordercontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/view/widget/d-appbar.dart';
import 'package:mechanice/view/widget/d-allorder.dart';

class Allorder extends StatelessWidget {
  const Allorder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllOrderController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          centerTitle: true,
          title: Text(
            "الطلبات",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        body: GetBuilder<AllOrderController>(builder: (controller) {
          return HandelingDataViewRequest(
              statusRequest: controller.statusRequest,
              widget:
                  Padding(padding: const EdgeInsets.all(18), child: DOrders()));
        }));
  }
}
