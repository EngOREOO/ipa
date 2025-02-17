import 'package:elmahdy/controller/products_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/view/widget/Listproductswidget.dart';
import 'package:flutter/material.dart';
import 'package:elmahdy/view/widget/topbarproductswidget.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController controller = Get.put(ProductsController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Products".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, right: 15, left: 15),
        child: Column(
          children: [
            TopbarProductsWidget(
              onFieldSubmitted: (val) {
                Get.offNamed(AppRoutes.SearchPage, arguments: {"name": val});
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: GetBuilder<ProductsController>(
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
                              ListProductsWidget(),
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
