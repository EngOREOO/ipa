import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/controller/onbording_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/data/datasource/static.dart';
import 'package:elmahdy/view/widget/onbording/buttononbordingwidget.dart';
import 'package:elmahdy/view/widget/onbording/dotonbordingwidget.dart';

class ListOnBordingWidget extends GetView<OnBordingController> {
  const ListOnBordingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onpagechanged(val);
      },
      itemCount: onbordinglist.length,
      itemBuilder: (context, i) => Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.8,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      onbordinglist[i].image!,
                    ),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.3,
              decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: Text(
                        onbordinglist[i].body!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      )),
                      const DotOnBordingWidget(),
                      const ButtonOnBordingWidget()
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
