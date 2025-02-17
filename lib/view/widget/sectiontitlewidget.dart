import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:get/get.dart';

class SectionTitleWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  const SectionTitleWidget({
    super.key,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 18,
            color: AppColor.sectiontitlecolor,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            "SeeAll".tr,
            style: TextStyle(
              fontSize: 12,
              color: AppColor.seeallhome,
            ),
          ),
        )
      ]),
    );
  }
}
