import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/servicetypycontroller.dart';
import 'package:mechanice/view/screen/driver/driverAllInfoPage.dart';
import 'package:mechanice/view/widget/button.dart';

import 'package:mechanice/view/widget/logo.dart';

import '../../../core/class/sizeconf.dart';

class DServiceTypePage extends StatelessWidget {
  DServiceTypePage({super.key});
  ServiceTypeControllerImp controller = Get.put(ServiceTypeControllerImp());
  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            SizedBox(
              height: SizeConf.screenHeight! * 0.04,
            ),
            const Logo(),
            SizedBox(
              height: SizeConf.screenHeight! * 0.02,
            ),
            const Text(
              'اختر للمتابعة',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: greyColor),
            ),
            SizedBox(
              height: SizeConf.screenHeight! * 0.08,
            ),
            Button(
                size: 24,
                hight: SizeConf.screenHeight! * 0.11,
                width: double.infinity,
                text: 'خدمة على الطريق',
                onTap: () {
                  String onWay = "1";

                  controller.goToAddLocation(onWay, controller.category_id!);
                }),
            SizedBox(
              height: SizeConf.screenHeight! * .06,
            ),
            Button(
              size: 24,
              hight: SizeConf.screenHeight! * .11,
              width: double.infinity,
              text: 'الخريطة ',
              onTap: () {
                controller.goTomap("0", controller.category_id!);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
