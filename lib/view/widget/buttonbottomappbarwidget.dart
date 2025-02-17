import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/controller/mainpage_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';

class ButtonBottomAppbarWidget extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final String? text;
  final Color? coloritemselected;
  final Color? center;
  final bool active;
  final double? sizeicon;

  final double? padding;
  const ButtonBottomAppbarWidget(
      {super.key,
      this.onPressed,
      this.icon,
      this.text,
      this.coloritemselected,
      required this.active,
      this.center,
      this.padding,
      this.sizeicon});

  @override
  Widget build(BuildContext context) {
    // MainPageController controller = Get.put(MainPageController());
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: center, shape: BoxShape.circle),
      // width: 70,
      padding: EdgeInsets.all(padding!),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          // mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active == true ? AppColor.scoundColor : AppColor.white,
              size: sizeicon,
            ),
            if (text != null)
              Text(
                text!,
                style: TextStyle(
                  fontSize: 13,
                  color: active == true ? AppColor.scoundColor : AppColor.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
