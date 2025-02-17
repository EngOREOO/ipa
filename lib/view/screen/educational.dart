import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/controller/educations_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:elmahdy/view/widget/productwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationalPage extends StatelessWidget {
  const EducationalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EducationsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("EducationalTraining".tr),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<EducationsController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.data.isNotEmpty
                        ? GridView.builder(
                            itemCount: controller.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.6,
                                    crossAxisSpacing: 18),
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () async {
                                  String link = controller.data[index]["link"];
                                  if (!await launchUrl(Uri.parse(link))) {
                                    throw Exception('Could not launch ');
                                  }
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          imageUrl: controller.data[index]
                                              ["image"]["url"],
                                          placeholder: (context, url) =>
                                              Image.asset(
                                            AppImageAssets.logo,
                                            fit: BoxFit.cover,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      Text(
                                        "${translateDatabase(controller.data[index]["title"]["ar"], controller.data[index]["title"]["en"])}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        "${translateDatabase(controller.data[index]["description"]["ar"], controller.data[index]["description"]["en"])}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: Text(
                              "soon".tr,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                  ))),
    );
  }
}
