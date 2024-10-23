import 'package:flutter/material.dart';

import 'package:mechanice/view/widget/button.dart';

// ignore: must_be_immutable
class ServiceButton extends StatelessWidget {
  ServiceButton({super.key, required this.text, required this.onTap});
  String? text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      child: Button(
        hight: 60,
        text: text!,
        onTap: onTap,
        size: 26,
      ),
    );
  }
}
