import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';

class TextFiledAccountWidget extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? Function(String?) valid;
  final bool? obscureText;

  final TextEditingController? mycontroller;

  const TextFiledAccountWidget(
      {super.key,
      this.title,
      this.hint,
      this.mycontroller,
      required this.valid,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        TextFormField(
          obscureText: obscureText!,
          validator: valid,
          controller: mycontroller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColor.geryinput),
            ),
          ),
        ),
      ],
    );
  }
}
