import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/controller/cart_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart".tr),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GetBuilder<CartController>(
          builder: (controller) => controller.data.isNotEmpty
              ? InkWell(
                  onTap: () {
                    controller.addinfodialog();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 220,
                      decoration: BoxDecoration(
                          color: AppColor.buttononbording,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "checkout".tr,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.white,
                            fontWeight: FontWeight.w600),
                      )),
                )
              : SizedBox(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: GetBuilder<CartController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.data.isNotEmpty
                      ? ListView(
                          children: [
                            Column(
                              children: [
                                ...List.generate(
                                    controller.data.length,
                                    (index) => Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          child: Card(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: CachedNetworkImage(
                                                      imageUrl: controller
                                                                  .data[index]
                                                              ["product"]
                                                          ["image"][0]["url"],
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  padding:
                                                      EdgeInsets.only(top: 30),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        // controller.data[index]
                                                        //     ["product"]["name"]["en"],
                                                        "${translateDatabase(controller.data[index]["product"]["name"]["ar"], controller.data[index]["product"]["name"]["en"])}",

                                                        style: TextStyle(
                                                            fontFamily: "inter",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 12),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      controller.removeqty(
                                                                          controller.data[index]
                                                                              [
                                                                              "id"]);
                                                                    },
                                                                    icon: Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size:
                                                                            23)),
                                                                Text(
                                                                  "${controller.data[index]["quantity"]}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      controller.addqty(
                                                                          controller.data[index]
                                                                              [
                                                                              "id"]);
                                                                    },
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      size: 23,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          IconButton(
                                                              onPressed: () {
                                                                controller.deleteproduct(
                                                                    controller.data[
                                                                            index]
                                                                        ["id"]);
                                                              },
                                                              icon: Icon(
                                                                  Icons.delete))
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ),
                                        ))
                              ],
                            ),
                            SizedBox(
                              height: 100,
                            )
                          ],
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImageAssets.emptycart,
                                width: 190,
                              ),
                              SizedBox(height: 20),
                              Text(
                                "emptycart".tr,
                                style: TextStyle(
                                    fontSize: 20, color: AppColor.scoundColor),
                              ),
                            ],
                          ),
                        ))),
        ));
  }
}
