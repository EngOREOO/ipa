import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/controller/favourite_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/constant/routes.dart';

class favouritePage extends StatelessWidget {
  const favouritePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite".tr),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<FavouriteController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.data.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.productdetailspage,
                                      arguments: {
                                        "idproduct": controller.data[index]
                                            ["id"]
                                      });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  child: Card(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                              imageUrl: controller.data[index]
                                                  ["image"][0]["url"],
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          padding: EdgeInsets.only(top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${translateDatabase(controller.data[index]["name"]["ar"], controller.data[index]["name"]["en"])}",
                                                style: TextStyle(
                                                  fontFamily: "inter",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Spacer(),
                                                  IconButton(
                                                      onPressed: () {
                                                        controller.removefav(
                                                            controller
                                                                    .data[index]
                                                                ["id"]);
                                                      },
                                                      icon:
                                                          Icon(Icons.favorite))
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: Text(
                              "nofav".tr,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                  ))),
    );
  }
}
