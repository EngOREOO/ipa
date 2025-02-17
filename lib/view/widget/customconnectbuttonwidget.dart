import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomConnectButtonWidget extends StatelessWidget {
  final String? text;
  final void Function()? ontap;
  final Color? color;
  final Color? bordercolor;
  final Color? textcolor;
  final Widget? widget;
  final double width;

  const CustomConnectButtonWidget(
      {Key? key,
      this.text,
      this.ontap,
      this.widget,
      this.color,
      this.textcolor,
      required this.width,
      this.bordercolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.29;

    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: bordercolor!, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              child: widget,
            ),
            // SizedBox(width: 7),
            Text(
              text!,
              style: TextStyle(
                fontSize: 12,
                color: textcolor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
