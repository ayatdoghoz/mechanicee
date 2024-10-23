import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/controller/driver/allordercontroller.dart';
import 'package:mechanice/controller/driver/onwayinfocontroller.dart';
import 'package:mechanice/controller/driver/ordercontroller.dart';
import 'package:mechanice/data/model/request.dart';

import 'package:mechanice/data/model/store.dart';
import 'package:mechanice/view/widget/button.dart';

import '../../core/class/sizeconf.dart';

class DOrders extends GetView<AllOrderController> {
  const DOrders({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConf().init(context);
    return ListView.builder(
        itemCount: controller.data.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return DOrder(request: controller.data[index]);
        });
  }
}

class DOrder extends GetView<AllOrderController> {
  final requestModel request;

  const DOrder({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 18),
        child: GestureDetector(
          onTap: () {
            controller.goToOrderInfo(
                request.paymentmethod.toString(), request.requestId.toString());
          },
          child: Container(
              padding: EdgeInsets.all(18),
              width: double.infinity,
              height: SizeConf.screenHeight! * 0.28,
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
                    " ${controller.printPaymentMethod(request.paymentmethod.toString())}  : طريقة الدفع",
                    style: TextStyle(color: blackColor, fontSize: 18),
                  ),
                  Text(
                    " ${request.time}  : وقت الطلب",
                    style: TextStyle(color: blackColor, fontSize: 18),
                  ),
                  Divider(),
                  Row(
                    children: [
                      if (request.status.toString() == "0")
                        Button(
                          text: "الغاء الطلب",
                          onTap: () {
                            controller.deletData(request.requestId);
                          },
                          hight: 40,
                          width: 80,
                          size: 15,
                        ),
                      Spacer(),
                      Text(
                        " حالة الطلب : ${controller.printOrderStatus(request.status.toString())}",
                        style: TextStyle(color: blackColor, fontSize: 18),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
