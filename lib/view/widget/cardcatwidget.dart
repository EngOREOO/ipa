import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/controller/categories_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/functions/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardCatWidget extends StatelessWidget {
  final String text;
  final String image;
  const CardCatWidget({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    CategoriesController controller = Get.put(CategoriesController());

    return Card(
      color: AppColor.white,
      surfaceTintColor: AppColor.white,
      shadowColor: Colors.grey, // لون الظل
      elevation: 2, // الارتفاع
      child: Container(
        padding: EdgeInsets.all(10),
        width: (MediaQuery.of(context).size.width / 2) - 20,
        height: 180,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: CachedNetworkImage(
                  imageUrl: image, width: 100, height: 100,
                  // placeholder: (context, url) => Image.asset(
                  //   AppImageAssets.logo,
                  //   fit: BoxFit.cover,
                  // ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImageAssets.lampcat),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.black,
                  ),
                  maxLines: 2, // تحديد عدد الأسطر المسموح بها
                  overflow: TextOverflow.ellipsis, // إضافة نقاط الانقطاع
                ),
              )
            ]),
      ),
    );
  }
}
