import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/allinfocontroller.dart';
import 'package:mechanice/view/widget/d-appbar.dart';
import 'package:mechanice/view/widget/button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/class/sizeconf.dart';

class DAllInfoPage extends StatelessWidget {
  const DAllInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllInfoControllerImp());
    SizeConf().init(context);

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
        body: GetBuilder<AllInfoControllerImp>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 8),
            child: ListView(children: [
              Column(
                children: [
                  Row(
                    children: [
                      controller.onWay.images != ""
                          ? Container(
                              height: 90,
                              width: 90,
                              child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      "http://10.0.2.2/mechanice/upload/${controller.onWay.images}")),
                            )
                          : Container(
                              height: 90,
                              width: 90,
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage("assets/images/images.png"),
                              ),
                            ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        controller.onWay.storename!,
                        style: const TextStyle(
                            color: greyColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConf.screenHeight! * 0.03,
                  ),
                  Container(
                    width: double.infinity,
                    height: SizeConf.screenHeight! * 0.45,
                    decoration: BoxDecoration(
                      border: Border.all(color: orangeColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await launchUrl(Uri.parse(
                                  "tel:${controller.onWay.storephone}"));
                            },
                            child: Text(
                              ':رقم الهاتف\n ${controller.onWay.storephone} \n',
                              style: const TextStyle(
                                  color: blackColor, fontSize: 20),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const Text(
                            ":ساعات الدوام",
                            style: TextStyle(color: blackColor, fontSize: 20),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            "${controller.onWay.start}  ->  ${controller.onWay.end} \n",
                            style: const TextStyle(
                                color: blackColor, fontSize: 20),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            ':الوصف\n ${controller.onWay.disc} \n',
                            style: const TextStyle(
                                color: blackColor, fontSize: 20),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConf.screenHeight! * 0.06,
                  ),
                  Button(
                    text: "تتبع الموقع",
                    onTap: () {
                      controller.location(
                          controller.onWay.address_lat.toString(),
                          controller.onWay.address_long.toString());
                    },
                    size: 20,
                    hight: SizeConf.screenHeight! * 0.07,
                  ),
                  SizedBox(
                    height: SizeConf.screenHeight! * 0.03,
                  ),
                  Button(
                    text: 'طلب خدمة على الطريق',
                    hight: SizeConf.screenHeight! * 0.07,
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                                width: double.infinity,
                                height: SizeConf.screenHeight! * 0.2,
                                child: Column(
                                  children: [
                                    const Text(
                                      "اختر طريقة الدفع",
                                      style: TextStyle(
                                          fontSize: 20, color: orangeColor),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          String type = "0";
                                          controller.payment(type);
                                          controller.order();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          child: const Text(
                                            "كاش",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                    InkWell(
                                        onTap: () {
                                          String type = "1";
                                          controller.payment(type);
                                          controller.order();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          child: const Text(
                                            "دفع الكتروني",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                  ],
                                ),
                              ));
                    },
                    size: 20,
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
