import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/mechanice/ordercontroller.dart';
import 'package:mechanice/data/model/request.dart';

import 'package:mechanice/view/widget/button.dart';
import 'package:mechanice/view/widget/d-orderstatus.dart';

import '../../core/class/sizeconf.dart';

class Orders extends GetView<OrderController> {
  Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.data.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Order(request: controller.data[index]);
        });
  }
}

class Order extends GetView<OrderController> {
  final requestModel request;
  const Order({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);

    return Padding(
        padding: EdgeInsets.only(bottom: 18),
        child: Container(
            padding: EdgeInsets.all(18),
            width: double.infinity,
            height: request.status == 0
                ? SizeConf.screenHeight! * 0.4
                : SizeConf.screenHeight! * 0.37,
            decoration: BoxDecoration(
              border: Border.all(color: orangeColor),
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  " ${request.requestId}  : رقم الطلب",
                  style: TextStyle(color: blackColor, fontSize: 18),
                ),
                Text(
                  "sp ${request.price}  : ثمن الطلب",
                  style: TextStyle(color: blackColor, fontSize: 18),
                ),
                Text(
                  " ${request.time}  : وقت الطلب",
                  style: TextStyle(color: blackColor, fontSize: 18),
                ),
                if (request.status == 1)
                  Text(
                    "تمت الموافقة على الطلب",
                    style: TextStyle(color: blackColor, fontSize: 18),
                  ),
                if (request.status == 2)
                  Text(
                    "تم تنفيذ الطلب بنجاح",
                    style: TextStyle(color: blackColor, fontSize: 18),
                  ),
                Divider(),
                Button(
                  text: "عرض الموقع",
                  onTap: () {
                    controller.goToLocation(request.requestId.toString(),
                        request.dlat.toString(), request.dlong.toString());
                  },
                  hight: SizeConf.screenHeight! * 0.07,
                  width: double.infinity,
                  size: 20,
                ),
                SizedBox(
                  height: SizeConf.screenHeight! * 0.02,
                ),
                if (request.status == 0)
                  Button(
                    text: "قبول الطلب",
                    onTap: () {
                      controller.approv(
                          request.requestId.toString(), request.dId.toString());
                    },
                    hight: SizeConf.screenHeight! * 0.07,
                    width: double.infinity,
                    size: 20,
                  ),
              ],
            )));
  }
}
