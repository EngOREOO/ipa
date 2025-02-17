import 'package:elmahdy/controller/BrandProductsController.dart';
import 'package:elmahdy/controller/products_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:elmahdy/view/widget/Listproductswidget.dart';
import 'package:elmahdy/view/widget/productwidget.dart';
import 'package:elmahdy/view/widget/rowsubcategorieswidget.dart';
import 'package:elmahdy/view/widget/sectiontitleproductwidget.dart';
import 'package:elmahdy/view/widget/sectiontitlewidget.dart';
import 'package:flutter/material.dart';
import 'package:elmahdy/view/widget/topbarproductswidget.dart';
import 'package:get/get.dart';

class BrandProductsPage extends StatelessWidget {
  const BrandProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    BrandProductsController controller = Get.put(BrandProductsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${translateDatabase(controller.infobrand["name"]["ar"], controller.infobrand["name"]["en"])}",
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, right: 15, left: 15),
        child: Column(
          children: [
            // TopbarProductsWidget(),
            SizedBox(height: 10),
            Expanded(
              child: GetBuilder<BrandProductsController>(
                  builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification scrollInfo) {
                              if (scrollInfo is ScrollEndNotification &&
                                  scrollInfo.metrics.pixels ==
                                      scrollInfo.metrics.maxScrollExtent) {
                                if (controller.statusRequest ==
                                    StatusRequest.loading) {
                                  print("####################");
                                }

                                controller.loadMoreData();
                              }
                              return false;
                            },
                            child: controller.products.isNotEmpty
                                ? ListView(
                                    children: [
                                      SectionTitleProductWidget(
                                        title: "Subsections".tr,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ...List.generate(
                                                controller.categories.length,
                                                (index) =>
                                                    RowSubCategoriesWidget(
                                                      onTap: () {
                                                        controller.getRowdata(
                                                            controller
                                                                .categories[
                                                                    index]["id"]
                                                                .toString());
                                                        controller.selectedcat =
                                                            index;
                                                      },
                                                      color: controller
                                                                  .selectedcat ==
                                                              index
                                                          ? AppColor.colorapp
                                                          : Colors.white,
                                                      name:
                                                          //  controller.categories[index]
                                                          //     ["name"]["en"]
                                                          "${translateDatabase(controller.categories[index]["name"]["ar"], controller.categories[index]["name"]["en"])}",
                                                      imageUrl: controller
                                                              .categories[index]
                                                          ["image"]["url"],
                                                    )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      GridView.builder(
                                          itemCount: controller.products.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 0.7,
                                                  crossAxisSpacing: 18),
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return ProductWidget(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .productdetailspage,
                                                    arguments: {
                                                      "idproduct": controller
                                                          .products[index]["id"]
                                                    });
                                              },
                                              imageUrl:
                                                  controller.products[index]
                                                      ["image"][0]["url"],
                                              price: controller.products[index]
                                                          ["price"] !=
                                                      null
                                                  ? "${controller.products[index]["price"]} ${'currency'.tr}"
                                                  : "",
                                              name:
                                                  //  controller.products[index]["name"]
                                                  //     ["en"],
                                                  "${translateDatabase(controller.products[index]["name"]["ar"], controller.products[index]["name"]["en"])}",
                                            );
                                          }),
                                      controller.nextPageUrl.isNotEmpty
                                          ? Container(
                                              alignment: Alignment.center,
                                              height: 100,
                                              width: 200,
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : SizedBox()
                                    ],
                                  )
                                : Center(
                                    child: Text(
                                      "noproducts".tr,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  )),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
