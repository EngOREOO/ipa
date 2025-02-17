import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/controller/categories_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/view/widget/sectiontitleproductwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandBottomSheetWidget extends StatelessWidget {
  const BrandBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SubCategoriesController controller = Get.put(SubCategoriesController());
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        color: AppColor.offwhite,
      ),
      height: 500,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SectionTitleProductWidget(
                title: "Select Brand",
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: controller.childbrandslist.length, // عدد العناصر
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // عدد العناصر في السطر الواحد
                crossAxisSpacing: 3, // المسافة الأفقية بين العناصر
                mainAxisSpacing: 10, // المسافة الرأسية بين العناصر

                childAspectRatio: 0.7, // تعديل العرض إلى الارتفاع بنسبة معينة
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    controller.gotoChildbrandproducts(
                        controller.childbrandslist[index]);
                    // print(controller.childbrandslist[index]);
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Card(
                            shape: CircleBorder(),
                            surfaceTintColor: AppColor.white,
                            shadowColor: Colors.grey, // لون الظل
                            elevation: 2, // الارتفاع
                            color: AppColor.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: CachedNetworkImage(
                                imageUrl: controller.childbrandslist[index]
                                    ["image"]["url"],
                                fit: BoxFit.contain,
                                width: 80,
                                height: 80,
                                placeholder: (context, url) => Image.asset(
                                  AppImageAssets.logo,
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            )),
                        Text(
                          controller.childbrandslist[index]["name"]["en"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColor.black,
                              fontFamily: "inter"),
                          maxLines: 1, // تحديد عدد الأسطر المسموح بها
                          overflow:
                              TextOverflow.ellipsis, // إضافة نقاط الانقطاع
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
