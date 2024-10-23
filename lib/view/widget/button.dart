import 'package:flutter/material.dart';
import 'package:mechanice/constant/constant.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  Button(
      {required this.text,
      required this.onTap,
      this.hight,
      this.width,
      this.size});
  String text;
  double? width;
  double? hight;
  VoidCallback? onTap;
  double? size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          color: orangeColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
