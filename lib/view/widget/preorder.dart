import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/mechanice/ordercontroller.dart';
import 'package:mechanice/controller/mechanice/preordercontroller.dart';
import 'package:mechanice/data/model/request.dart';

import 'package:mechanice/view/widget/button.dart';
import 'package:mechanice/view/widget/d-orderstatus.dart';

import '../../core/class/sizeconf.dart';

class PreOrders extends GetView<PreOrderController> {
  PreOrders({super.key});

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

class Order extends GetView<PreOrderController> {
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
            height: SizeConf.screenHeight! * 0.3,
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
                // Text(
                //   " ${controller.printPaymentMethod(request.paymentmethod.toString())}  : طريقة الدفع",
                //   style: TextStyle(color: blackColor, fontSize: 18),
                // ),
                Text(
                  " ${request.time}  : وقت الطلب",
                  style: TextStyle(color: blackColor, fontSize: 18),
                ),
                Divider(),
                // Row(
                //   children: [
                // if (request.status.toString() == "0")
                // Button(
                //   text: "قبول الطلب",
                //   onTap: () {
                //     // controller.deletData(request.requestId);
                //   },
                // hight: 60,
                // width: double.infinity,
                // size: 20,

                // Spacer(),
                Text(
                  " تم تنفيذ الطلب",
                  style: TextStyle(color: blackColor, fontSize: 18),
                ),
                // ],
                // )
              ],
            )));
  }
}
