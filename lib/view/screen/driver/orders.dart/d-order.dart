import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/ordercontroller.dart';
import 'package:mechanice/core/class/hanelingdataview.dart';
import 'package:mechanice/view/widget/d-appbar.dart';
import 'package:mechanice/view/widget/button.dart';
import 'package:mechanice/view/widget/d-orderstatus.dart';
import 'package:url_launcher/url_launcher.dart';

class DOrder extends StatelessWidget {
  DOrder({super.key});

  @override
  Widget build(BuildContext context) {
    OrderControllerImp controller = Get.put(OrderControllerImp());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          centerTitle: true,
          actions: [DAppBarAction()],
          title: const Text(
            "ميكانيكي",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        body: GetBuilder<OrderControllerImp>(
            builder: (controller) => HandelingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding: const EdgeInsets.all(18),
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            controller.data[index].status.toString() == "0"
                                ? const SizedBox(
                                    height: 150,
                                  )
                                : const SizedBox(
                                    height: 40,
                                  ),
                            OrderStatus(
                                text: controller.printOrderStatus(
                                    controller.data[index].status.toString()),
                                icon:
                                    controller.data[index].status.toString() ==
                                            "0"
                                        ? Icons.access_time
                                        : Icons.done_outline,
                                height: 300),
                            const SizedBox(
                              height: 70,
                            ),
                            if (controller.data[index].status.toString() == "1")
                              Button(
                                  size: 24,
                                  hight: 60,
                                  text: "عرض الموقع",
                                  onTap: () {
                                    controller.tracking();
                                  }),
                            SizedBox(
                              height: 30,
                            ),
                            if (controller.data[index].status.toString() == "1")
                              Column(
                                children: [
                                  Divider(),
                                  Text(
                                    "إتمام عملية الدفع",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  controller.type == "1"
                                      ? Button(
                                          size: 20,
                                          hight: 40,
                                          width: 190,
                                          text: "الدفع",
                                          onTap: () {
                                            controller.finish(controller
                                                .data[index].mId
                                                .toString());
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) => Container(
                                                      width: double.infinity,
                                                      height: 150,
                                                      child: Column(
                                                        children: [
                                                          const Text(
                                                            "اختر طريقة الدفع",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                    orangeColor),
                                                          ),
                                                          InkWell(
                                                              onTap: () async {
                                                                await launchUrl(
                                                                    Uri.parse(
                                                                        "https://cash.mtnsyr.com/"));
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16),
                                                                child:
                                                                    const Text(
                                                                  "MTN",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              )),
                                                          InkWell(
                                                              onTap: () async {
                                                                await launchUrl(
                                                                    Uri.parse(
                                                                        "https://my.syriatel.sy/"));
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16),
                                                                child:
                                                                    const Text(
                                                                  "Syriatel",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ));
                                          })
                                      : Button(
                                          size: 20,
                                          hight: 40,
                                          width: 190,
                                          text: "تم",
                                          onTap: () {
                                            controller.finish(controller
                                                .data[index].mId
                                                .toString());
                                          })
                                ],
                              ),
                          ]),
                    ),
                  ),
                )));
  }
}
