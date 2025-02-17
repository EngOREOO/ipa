import 'package:elmahdy/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:get/get.dart';

class TopBarAccountWidget extends StatelessWidget {
  const TopBarAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Container(
      color: AppColor.buttononbording,
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              padding: EdgeInsets.all(13),
              width: 90,
              height: 90,
              color: AppColor.white,
              child: Image.asset(AppImageAssets.person),
            ),
          ),
          SizedBox(height: 10),
          Text(
            myServices.sharedPreferences.getString("name") != null
                ? "${myServices.sharedPreferences.getString("name")}"
                : "login".tr,
            style: TextStyle(color: AppColor.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
