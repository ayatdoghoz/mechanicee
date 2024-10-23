import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonText extends StatelessWidget {
  ButtonText({super.key, required this.text, required this.onpreesed});
  String text;
  VoidCallback? onpreesed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpreesed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
