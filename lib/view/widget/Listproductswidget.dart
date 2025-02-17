import 'package:elmahdy/controller/products_controller.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:elmahdy/view/widget/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListProductsWidget extends StatelessWidget {
  const ListProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController controller = Get.put(ProductsController());
    return GridView.builder(
        itemCount: controller.products.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 18),
        itemBuilder: (BuildContext context, index) {
          return ProductWidget(
            onTap: () {
              Get.toNamed(AppRoutes.productdetailspage,
                  arguments: {"idproduct": controller.products[index]["id"]});
              // print(controller.products[index]["id"]);
            },
            imageUrl: controller.products[index]["image"][0]["url"],
            price: controller.products[index]["price"] != null
                ? "${controller.products[index]["price"]} ${'currency'.tr}"
                : "",

            name:
                "${translateDatabase(controller.products[index]["name"]["ar"], controller.products[index]["name"]["en"])}",

            //  controller.products[index]["name"]["en"],
          );
        });
  }
}
