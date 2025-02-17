import 'package:flutter/material.dart';

class CircleBackgroundCatWidget extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
  const CircleBackgroundCatWidget(
      {super.key,
      this.top,
      this.left,
      this.right,
      this.bottom,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: bottom,
        right: right,
        top: top,
        left: left,
        child: Container(
            width: width, // تعيين عرض الحاوية
            height: height, // تعيين ارتفاع الحاوية
            decoration: BoxDecoration(
                shape: BoxShape.circle, // جعل شكل الحاوية دائري
                color: Color.fromARGB(61, 5, 122, 200) // تعيين لون الحاوية
                )));
  }
}
