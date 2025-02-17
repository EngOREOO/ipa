import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';

class TextBackgroundCatWidget extends StatelessWidget {
  final String text;
  const TextBackgroundCatWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColor.white,
        fontSize: 30,
      ),
    );
  }
}
