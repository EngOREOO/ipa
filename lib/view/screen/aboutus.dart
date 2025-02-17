import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "aboutus".tr,
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Image.asset(
              AppImageAssets.logo,
              width: 150,
              height: 150,
            ),
            Column(
              children: [
                Text(
                  "WHO ARE WE?".tr,
                  style: TextStyle(color: AppColor.primaryColor, fontSize: 15),
                ),
                Text(
                  "whowearedis".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.greybody, fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
