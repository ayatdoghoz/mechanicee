import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:mechanice/constant/constant.dart';

class OrderStatus extends StatelessWidget {
  OrderStatus(
      {super.key,
      required this.text,
      required this.icon,
      required this.height});
  late String text;
  double height;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: blackColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Icon(
            icon,
            color: blackColor,
            size: 110,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
