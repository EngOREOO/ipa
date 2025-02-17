import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';

class SectionTitleAccountWidget extends StatelessWidget {
  final String title;
  final double? top;

  const SectionTitleAccountWidget({super.key, required this.title, this.top});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15, top: top!),
      child: Text(
        title,
        style:
            TextStyle(color: AppColor.sectiontitleaccountwidget, fontSize: 15),
      ),
    );
  }
}
