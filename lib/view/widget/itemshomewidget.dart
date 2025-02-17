import 'package:elmahdy/controller/latestproducts_controller.dart';
import 'package:elmahdy/controller/products_controller.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:elmahdy/view/widget/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';

class ItemsHomeWidget extends StatelessWidget {
  const ItemsHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LatestProductsController());

    return GetBuilder<LatestProductsController>(
        builder: (controller) => GridView.builder(
            itemCount: controller.products.length > 10
                ? 10
                : controller.products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 18),
            itemBuilder: (BuildContext context, index) {
              return ProductWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.productdetailspage, arguments: {
                    "idproduct": controller.products[index]["id"]
                  });
                  // print(controller.products[index]["id"]);
                },
                imageUrl: controller.products[index]["image"][0]["url"],
                price: controller.products[index]["price"] != null
                    ? "${controller.products[index]["price"]} ${'currency'.tr}"
                    : "",
                name:
                    "${translateDatabase(controller.products[index]["name"]["ar"], controller.products[index]["name"]["en"])}",
              );
            }));
  }
}
