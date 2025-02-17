import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';

class SectionTitleProductWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  const SectionTitleProductWidget({
    super.key,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(children: [
        Text(
          title!,
          style: TextStyle(
              fontSize: 18,
              color: AppColor.sectiontitlecolor,
              fontFamily: "opensans"),
        ),
        // Spacer(),
        // InkWell(
        //   onTap: onTap,
        //   child: Text(
        //     "See All",
        //     style: TextStyle(
        //         fontSize: 12,
        //         color: AppColor.seeallhome,
        //         fontFamily: "opensans"),
        //   ),
        // )
      ]),
    );
  }
}
