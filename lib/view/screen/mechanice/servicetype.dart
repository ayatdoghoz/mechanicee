import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/mechanice/servicetypecontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/core/class/sizeconf.dart';

import 'package:mechanice/view/widget/logo.dart';
import 'package:mechanice/view/widget/servicetypewidget.dart';

class ServiceTypePage extends StatelessWidget {
  const ServiceTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServiceTypeControllerImp());
    SizeConf().init(context);

    return Scaffold(
        body: GetBuilder<ServiceTypeControllerImp>(
            builder: (controller) => HandelingDataViewRequest(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Logo(),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'حدد نوع الخدمة المتوفرة',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ServiceTypy()
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
