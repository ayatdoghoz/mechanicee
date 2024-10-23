import 'package:flutter/material.dart';
import 'package:mechanice/constant/constant.dart';

// ignore: must_be_immutable
class AuthTextField extends StatelessWidget {
  AuthTextField(
      {super.key,
      required this.lable,
      this.hintText,
      this.width,
      required this.hight,
      this.onChanged,
      this.obscureText = false,
      required this.valid,
      required this.mycontroller});

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
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 2,
            ),
          ),
          TextFormField(
            controller: mycontroller,
            style: TextStyle(color: blackColor, fontSize: 20),
            obscureText: obscureText!,
            textAlign: TextAlign.left,
            validator: valid,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: hight!),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: orangeColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: orangeColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              hintText: hintText,
              hintStyle: TextStyle(
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
