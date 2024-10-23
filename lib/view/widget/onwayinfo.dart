import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/onwayinfocontroller.dart';

import 'package:mechanice/data/model/store.dart';

import '../../core/class/sizeconf.dart';

class OnWayInfo extends GetView<OnWayInfoControllerImp> {
  const OnWayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.data.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return OnWays(onWay: StoreModel.fromJson(controller.data[index]));
        });
  }
}

class OnWays extends GetView<OnWayInfoControllerImp> {
  final StoreModel onWay;
  const OnWays({super.key, required this.onWay});

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);

    return Padding(
        padding: EdgeInsets.only(bottom: 18),
        child: GestureDetector(
          onTap: () {
            controller.goToAllInfo(onWay);
          },
          child: Container(
            width: double.infinity,
            height: SizeConf.screenHeight! * .17,
            decoration: BoxDecoration(
              border: Border.all(color: orangeColor),
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: onWay.images != ""
                      ? Container(
                          height: 65,
                          width: 65,
                          child: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  "http://10.0.2.2/mechanice/upload/${onWay.images}")),
                        )
                      : Container(
                          height: 65,
                          width: 65,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage("assets/images/images.png"),
                          ),
                        ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${onWay.storename}",
                      style: TextStyle(color: Color(0x4c000000), fontSize: 20),
                    ),
                    Text(
                      ":اسم المالك\n ${onWay.ownerName}",
                      style: TextStyle(color: blackColor, fontSize: 15),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
