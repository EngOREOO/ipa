import 'package:elmahdy/controller/BrandProductsController.dart';
import 'package:elmahdy/controller/latestproducts_controller.dart';
import 'package:elmahdy/controller/offersproducts_controller.dart';
import 'package:elmahdy/controller/products_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
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

class OffersProductsPage extends StatelessWidget {
  const OffersProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersProductsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Offers".tr,
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
              child: GetBuilder<OffersProductsController>(
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
                          child: ListView(
                            children: [
                              GridView.builder(
                                  itemCount: controller.products.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7,
                                          crossAxisSpacing: 18),
                                  itemBuilder: (BuildContext context, index) {
                                    return ProductWidget(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.productdetailspage,
                                            arguments: {
                                              "idproduct": controller
                                                  .products[index]["id"]
                                            });
                                      },
                                      imageUrl: controller.products[index]
                                          ["image"][0]["url"],
                                      price: controller.products[index]
                                                  ["price"] !=
                                              null
                                          ? "${controller.products[index]["price"]} ${'currency'.tr}"
                                          : "",
                                      name:
                                          // controller.products[index]["name"]
                                          //     ["en"],
                                          "${translateDatabase(controller.products[index]["name"]["ar"], controller.products[index]["name"]["en"])}",
                                    );
                                  }),
                              Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 200,
                                child:
                                    CircularProgressIndicator(), // Replace Text with CircularProgressIndicator
                              )
                            ],
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
