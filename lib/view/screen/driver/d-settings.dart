import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/settingcontroller.dart';

class DSettings extends StatelessWidget {
  const DSettings({super.key});

  @override
  Widget build(BuildContext context) {
    DSettingController controller = Get.put(DSettingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: const Text(
          "ميكانيكي",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Container(
              padding: EdgeInsets.only(
                right: 10,
              ),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: blackColor),
              height: 80,
              width: double.infinity,
              child: GestureDetector(
                child: Text(
                  "الطلبات",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  controller.goToOrder();
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: blackColor),
            height: 80,
            width: double.infinity,
            child: GestureDetector(
              child: Text(
                "تسجيل الخروج",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                controller.goToexit();
              },
            ),
          )
        ],
      ),
    );
  }
}
