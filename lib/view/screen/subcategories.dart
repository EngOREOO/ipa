import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:elmahdy/view/widget/brandcardcatwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/controller/categories_controller.dart';
import 'package:elmahdy/view/widget/cardcatwidget.dart';
import 'package:elmahdy/view/widget/circlebackgroundcatwidget.dart';
import 'package:elmahdy/view/widget/textbackgroundcatwidget.dart';
import 'package:elmahdy/core/constant/colors.dart';

class SubCategoriesPage extends StatelessWidget {
  const SubCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(CategoriesController());
    SubCategoriesController controller = Get.put(SubCategoriesController());

    return Scaffold(
      body: Container(
        color: AppColor.backgroundcate,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 50,
              foregroundColor: AppColor.white,
              backgroundColor: AppColor.backgroundcate,
              elevation: 0,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 7,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      width: 700, // Ensures full width
                      color: AppColor.backgroundcate,
                    ),
                    CircleBackgroundCatWidget(
                      top: -20,
                      left: controller.lang == "en" ? -30 : null,
                      right: controller.lang == "ar" ? -30 : null,
                      width: 150,
                      height: 150,
                    ),
                    CircleBackgroundCatWidget(
                      top: 80,
                      right: controller.lang == "en" ? -13 : null,
                      left: controller.lang == "ar" ? -13 : null,
                      width: 150,
                      height: 150,
                    ),
                    Positioned(
                      top: -15,
                      right: controller.lang == "en" ? -0 : null,
                      left: controller.lang == "ar" ? -0 : null,
                      child: Image.asset(AppImageAssets.ceiling),
                      width: 120,
                      height: 120,
                    ),
                    Positioned(
                      top: 80,
                      left: controller.lang == "en" ? 30 : null,
                      right: controller.lang == "ar" ? 30 : null,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          // controller.subcategories["name"]["en"]
                          "${translateDatabase(controller.subcategories["name"]["ar"], controller.subcategories["name"]["en"])}",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // يجعل النص يظهر نقط الانقطاع عند النهاية
                          maxLines: 2, // يحدد عدد الأسطر المراد عرضها
                          softWrap: true, // يسمح بالانتقال إلى سطر جديد
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.offwhite,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: GetBuilder<SubCategoriesController>(
                          builder: (controller) => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller.brands.length > 0
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Brands".tr,
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  controller.brands.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 40,
                                                mainAxisSpacing: 15,
                                              ),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    print(controller
                                                        .brands[index]);
                                                    controller
                                                        .gotobrandproducts(
                                                            controller
                                                                .brands[index]);
                                                  },
                                                  child: BrandCardCatWidget(
                                                    text:
                                                        // controller.brands[index]
                                                        //     ["name"]["en"]
                                                        "${translateDatabase(controller.brands[index]["name"]["ar"], controller.brands[index]["name"]["en"])}",
                                                    imageUrl:
                                                        controller.brands[index]
                                                            ["image"]["url"],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  controller.childreen.length > 0
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "subcategories".tr,
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  controller.childreen.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 5,
                                                childAspectRatio: 0.9,
                                                mainAxisSpacing: 15,
                                              ),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    print(controller
                                                        .childreen[index]);
                                                    controller.childbrands(
                                                        controller.childreen[
                                                                index]
                                                            ["child_brands"]);
                                                  },
                                                  child: CardCatWidget(
                                                    image: controller.childreen[
                                                                    index]
                                                                ["image"] !=
                                                            null
                                                        ? controller.childreen[
                                                                index]["image"]
                                                            ["url"]
                                                        : "ss",
                                                    text:
                                                        //  controller
                                                        //         .childreen[index]
                                                        //     ["name"]["en"]
                                                        "${translateDatabase(controller.childreen[index]["name"]["ar"], controller.childreen[index]["name"]["en"])}",
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : SizedBox()
                                ],
                              ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
