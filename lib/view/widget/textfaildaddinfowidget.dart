import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';

class TextFiledAddinfoWidget extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool? obscureText;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final String? Function(String?) valid;

  final TextEditingController? mycontroller;

  const TextFiledAddinfoWidget(
      {super.key,
      this.title,
      this.hint,
      this.mycontroller,
      required this.valid,
      this.obscureText,
      this.textInputAction,
      TextInputType? textInputType,
      this.maxLines});

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
          maxLines: maxLines,
          textInputAction: textInputAction,
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
