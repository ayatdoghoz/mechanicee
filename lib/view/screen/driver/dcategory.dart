import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/catrgorycontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/view/widget/category.dart';

import 'package:mechanice/view/widget/logo.dart';

class DriverCategoryPage extends StatelessWidget {
  const DriverCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryControllerImp());
    return Scaffold(
        body: GetBuilder<CategoryControllerImp>(
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
                            'حدد نوع الخدمة المطلوبة',
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Category()
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
