import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';

class DotOffersSwiperWidget extends StatelessWidget {
  final SwiperPluginConfig config;

  const DotOffersSwiperWidget({Key? key, required this.config})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(config.itemCount, (index) {
        bool isActive = index == config.activeIndex;
        return Container(
          margin: EdgeInsets.all(5),
          width: isActive ? 23.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: isActive
                ? BorderRadius.circular(12.0)
                : BorderRadius.circular(200),
            color: isActive ? AppColor.dotactive : AppColor.dotnotactive,
          ),
        );
      }),
    );
  }
}
