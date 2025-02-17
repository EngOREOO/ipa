import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/controller/categories_controller.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';

class CategoriesHomeWidget extends StatelessWidget {
  const CategoriesHomeWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    CategoriesController controller = Get.put(CategoriesController());
    return GetBuilder<CategoriesController>(
        builder: (controller) => Container(
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(
                  controller.categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: InkWell(
                      onTap: () {
                        controller.Go(controller.categories[index]);
                      },
                      child: Column(
                        children: [
                          ClipOval(
                            child: Container(
                              padding: EdgeInsets.all(13),
                              width: 60,
                              height: 60,
                              color: AppColor.categoriescolor,
                              child: CachedNetworkImage(
                                imageUrl: controller.categories[index]
                                            ["image"] !=
                                        null
                                    ? controller.categories[index]["image"]
                                        ["url"]
                                    : "ss",
                                // placeholder: (context, url) => Image.asset(
                                //   AppImageAssets.logo,
                                //   fit: BoxFit.cover,
                                // ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(AppImageAssets.catg),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Text(
                              "${translateDatabase(controller.categories[index]["name"]["ar"], controller.categories[index]["name"]["en"])}",

                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "opensans",
                                color: AppColor.categoriesnamecolor,
                              ),
                              maxLines: 2, // تحديد الحد الأقصى لعدد الأسطر
                              overflow: TextOverflow
                                  .ellipsis, // تلخيص بنقاط الإليبسس عند التجاوز
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
