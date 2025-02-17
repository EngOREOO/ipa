import 'package:elmahdy/controller/home_controller.dart';
import 'package:elmahdy/controller/products_controller.dart';
import 'package:elmahdy/view/widget/sectiontitleproductwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/view/widget/appbarhomewidget.dart';
import 'package:elmahdy/view/widget/categorieshomewidget.dart';
import 'package:elmahdy/view/widget/offershomewidget.dart';
import 'package:elmahdy/view/widget/itemshomewidget.dart';
import 'package:elmahdy/view/widget/searchhomewidget.dart';
import 'package:elmahdy/view/widget/sectiontitlewidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsController());
    Get.put(HomeController());
    return Scaffold(
        appBar: AppBarHomeWidget(),
        body: GetBuilder<ProductsController>(
          builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(children: [
                SearchHomeWidget(
                  onFieldSubmitted: (val) {
                    Get.toNamed(AppRoutes.SearchPage, arguments: {"name": val});
                  },
                ),
                // SectionTitleWidget(title: "Special Offers"),

                OffersHomeWidget(),
                SectionTitleWidget(
                  title: "Categories".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.categoriespage);
                  },
                ),
                CategoriesHomeWidget(),
                SectionTitleWidget(
                  title: "LatestProducts".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.LatestProductsPage);
                  },
                ),
                ItemsHomeWidget()
              ])),
        ));
  }
}
