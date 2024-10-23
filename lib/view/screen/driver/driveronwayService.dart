import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/onwayinfocontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/view/widget/d-appbar.dart';

import 'package:mechanice/view/widget/onwayinfo.dart';

class DOnWayService extends StatelessWidget {
  const DOnWayService({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnWayInfoControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          centerTitle: true,
          actions: [DAppBarAction()],
          title: Text(
            "ميكانيكي",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        body: GetBuilder<OnWayInfoControllerImp>(builder: (controller) {
          return HandelingDataViewRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                  padding: const EdgeInsets.all(18), child: OnWayInfo()));
        }));
  }
}
