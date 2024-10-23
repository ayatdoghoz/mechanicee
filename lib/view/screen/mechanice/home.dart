import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/mechanice/homecontroller.dart';
import 'package:mechanice/controller/mechanice/ordercontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/view/screen/mechanice/order.dart';

import 'package:mechanice/view/widget/appbar.dart';
import 'package:mechanice/view/widget/button.dart';
import 'package:mechanice/view/widget/d-orderstatus.dart';

import '../../../core/class/sizeconf.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    SizeConf().init(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          centerTitle: true,
          actions: [AppBarAction()],
          title: const Text(
            "ميكانيكي",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        body: GetBuilder<HomeController>(
            builder: (controller) => HandelingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: SizeConf.screenHeight! * .04,
                          ),
                          controller.onway == "0"
                              ? Center(
                                  heightFactor: 15,
                                  child: Text(
                                    'سعداء بانضمامك إلى خريطتنا',
                                    style: TextStyle(
                                      color: greyColor,
                                      fontSize: 25,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: SizeConf.screenHeight! * .2,
                                    ),
                                    Button(
                                      hight: SizeConf.screenHeight! * 0.11,
                                      width: double.infinity,
                                      text: "الطلبات قيد الانتظار",
                                      onTap: () {
                                        controller.goToOrder();
                                      },
                                      size: 24,
                                    ),
                                    SizedBox(
                                      height: SizeConf.screenHeight! * .05,
                                    ),
                                    Button(
                                        hight: SizeConf.screenHeight! * 0.11,
                                        width: double.infinity,
                                        size: 24,
                                        text: "الطلبات السابقة",
                                        onTap: () {
                                          controller.goToPreOrder();
                                        })
                                  ],
                                ),
                        ]),
                  ),
                )));
  }
}
