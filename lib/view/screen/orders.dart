import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/controller/orders_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/view/widget/productcardwidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders".tr),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<OrdersController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.data.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "state:".tr,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColor.primaryColor),
                                        ),
                                        Text(
                                          " : ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColor.primaryColor),
                                        ),
                                        Text(
                                          controller.data[index]["state"],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColor.primaryColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "city:".tr,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColor.primaryColor),
                                        ),
                                        Text(
                                          " : ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColor.primaryColor),
                                        ),
                                        Text(
                                          controller.data[index]["city"],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColor.primaryColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "street:".tr,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "opensans",
                                              color: AppColor.primaryColor),
                                        ),
                                        Text(
                                          " : ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColor.primaryColor),
                                        ),
                                        Text(
                                          controller.data[index]["street"],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "opensans",
                                              color: AppColor.primaryColor),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              );
                            })
                        : Center(
                            child: Text(
                              "noorders".tr,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                  ))),
    );
  }
}
