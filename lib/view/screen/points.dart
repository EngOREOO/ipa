import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:elmahdy/controller/points_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PointsPage extends StatelessWidget {
  const PointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PointsController());

    // الحصول على حجم الشاشة
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        title: Text("points".tr),
      ),
      body: GetBuilder<PointsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Expanded(
                  child: CouponCard(
                    backgroundColor: AppColor.white,
                    curvePosition: 230,
                    shadow: BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                    firstChild: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset(
                            AppImageAssets.coins,
                            width: screenSize.width * 0.2, // تعديل حجم الصورة
                          ),
                          SizedBox(height: 10),
                          Text(
                            "points".tr,
                            style: TextStyle(
                                fontSize:
                                    screenSize.width * 0.05), // تعديل حجم النص
                          ),
                          Text(
                            controller.points,
                            style: TextStyle(
                                fontSize:
                                    screenSize.width * 0.1), // تعديل حجم النص
                          ),
                        ],
                      ),
                    ),
                    secondChild: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            "pointsystem".tr,
                            style: TextStyle(
                                fontSize:
                                    screenSize.width * 0.045), // تعديل حجم النص
                          ),
                          SizedBox(height: 10),
                          Text(
                            "infopoints".tr,
                            textAlign: TextAlign.center,
                          ),
                          Spacer(),
                          controller.data.isNotEmpty &&
                                  controller.data[0]["offers"].isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                            text: controller.code))
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text('donecopy'.tr)),
                                      );
                                    });
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.copy,
                                              color: const Color.fromARGB(
                                                  146, 0, 0, 0),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              controller.code,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06, // تعديل حجم النص
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text("currentcode".tr)
                                      ],
                                    ),
                                  ),
                                )
                              : Opacity(
                                  opacity: int.parse(controller.points) > 10
                                      ? 1
                                      : 0.5,
                                  child: InkWell(
                                    onTap: () {
                                      controller.getcode();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xfffbb72c),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      height: screenSize.height *
                                          0.07, // تعديل ارتفاع الزر
                                      alignment: AlignmentDirectional.center,
                                      width: double.infinity,
                                      child: Text(
                                        "newcode".tr,
                                        style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: screenSize.width *
                                              0.04, // تعديل حجم النص
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
