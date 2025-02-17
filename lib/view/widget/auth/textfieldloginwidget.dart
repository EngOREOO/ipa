import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final String labletext;
  final String? Function(String?) valid;
  final TextEditingController? mycontroller;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final bool? scureText;
  final Widget? icon;
  const TextFieldLoginWidget(
      {super.key,
      required this.labletext,
      required this.valid,
      this.mycontroller,
      this.autovalidateMode,
      this.keyboardType,
      this.scureText,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      obscureText: scureText == null || scureText == false ? false : true,
      controller: mycontroller,
      validator: valid,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintStyle: const TextStyle(fontSize: 14),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            labletext,
            style: TextStyle(
                fontSize: 20,
                fontFamily: "inter",
                fontWeight: FontWeight.w700,
                color: AppColor.scoundColor),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(color: AppColor.scoundColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(color: AppColor.scoundColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(color: AppColor.scoundColor, width: 2),
        ),
      ),
    );
  }
}
