import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';

class ButtonAccountWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;

  const ButtonAccountWidget({super.key, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
            ),
            SizedBox(width: 10),
            Text(
              text!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.grey2,
              size: 18,
            ),
          ],
        ),
        Divider(),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
