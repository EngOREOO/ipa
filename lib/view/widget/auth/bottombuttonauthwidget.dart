import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';

class BottomButtonAuthWidget extends StatelessWidget {
  final String? text;
  final String? textbutton;
  final void Function()? onTap;

  const BottomButtonAuthWidget(
      {super.key, this.text, this.textbutton, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text!,
          style: TextStyle(fontSize: 16, fontFamily: "jost"),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textbutton!,
            style: TextStyle(
                color: AppColor.scoundColor, fontSize: 17, fontFamily: "jost"),
          ),
        )
      ],
    ));
  }
}
