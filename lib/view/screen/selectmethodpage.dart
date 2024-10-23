import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/selectcontroller.dart';
import 'package:mechanice/core/class/sizeconf.dart';
import 'package:mechanice/core/functions/alartexit.dart';
import 'package:mechanice/view/widget/button.dart';

import '../../core/class/hanelingdataview.dart';

class SelectMethodePage extends StatelessWidget {
  const SelectMethodePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);
    Get.put(SelectController());
    return Scaffold(
        body: GetBuilder<SelectController>(
            builder: (controller) => HandelingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(children: [
                        SizedBox(
                          height: SizeConf.screenHeight! * 0.2,
                        ),
                        const Text(
                          'مرحبا بك في تطبيق ميكانيكي',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'يرجى الاختيار للمتابعة',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: greyColor),
                        ),
                        SizedBox(
                          height: SizeConf.screenHeight! * .09,
                        ),
                        Button(
                            size: 24,
                            hight: SizeConf.screenHeight! * .11,
                            width: double.infinity,
                            text: 'سائق',
                            onTap: () {
                              controller.driver();
                            }),
                        const SizedBox(
                          height: 60,
                        ),
                        Button(
                          size: 24,
                          hight: SizeConf.screenHeight! * .11,
                          width: double.infinity,
                          text: 'مقدم خدمة',
                          onTap: () {
                            controller.mechanice();
                          },
                        ),
                        Spacer(),
                        Text(
                          "انضم الى أكثر من ${controller.count} مستخدم",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ]),
                    ),
                  ),
                )));
  }
}
