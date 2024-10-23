import 'package:flutter/material.dart';
import 'package:mechanice/constant/constant.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.lable,
      this.hintText,
      this.width,
      required this.hight,
      this.onChanged,
      this.obscureText = false,
      this.mycontroller,
      required this.valid});
  Function(String)? onChanged;

  String? hintText;
  final String? Function(String?) valid;
  String lable;
  bool? obscureText;
  double? width;
  double? hight;
  TextEditingController? mycontroller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            lable,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 2,
            ),
          ),
          TextFormField(
            controller: mycontroller,
            style: const TextStyle(
              color: blackColor,
              fontSize: 18,
            ),
            obscureText: obscureText!,
            textAlign: TextAlign.right,
            validator: valid,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: hight!, horizontal: 3),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: orangeColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: orangeColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(212, 149, 144, 144),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
