import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';

class buttonauthwidget extends StatelessWidget {
  final Color? color;
  final Color? textcolor;
  final double? width;
  final double? height;
  final String text;
  final void Function()? onTap;
  const buttonauthwidget(
      {super.key,
      this.color,
      this.width,
      this.height,
      this.textcolor,
      required this.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.buttononbording,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          text,
          style: TextStyle(
              color: AppColor.white, fontSize: 20, fontFamily: "jost"),
        ),
      ),
    );
  }
}
