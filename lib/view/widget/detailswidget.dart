import 'package:elmahdy/controller/productdetails_controller.dart';
import 'package:elmahdy/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:get/get.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    return GetBuilder<ProductDetailsController>(
        builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Text(
                    // controller.product["name"]["en"],
                    "${translateDatabase(controller.product["name"]["ar"], controller.product["name"]["en"])}",

                    style: TextStyle(
                        color: AppColor.black,
                        fontFamily: "opensans",
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ),
                controller.product["price"] != null
                    ? Text(
                        "${controller.product["price"]} ${'currency'.tr}",
                        style: TextStyle(fontSize: 18),
                      )
                    : SizedBox(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        controller.addquantity();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.scoundColor,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.add,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffE0E0E0)),
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 50,
                        child: Text(
                          "${controller.quantity}",
                          style: TextStyle(fontSize: 16),
                        )),
                    InkWell(
                      onTap: () {
                        controller.removequantity();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.scoundColor,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.remove,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ]),
                ),
                controller.variants.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "${controller.product["variants"][0]["name"]} : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.variants[0]["values"].length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.addtooptions(
                                          controller.variants[0]["values"]
                                              [index]["options"],
                                          index,
                                          controller.variants[0]["id"],
                                          controller.variants[0]["values"]
                                                  [index]["image"] ??
                                              0);

                                      // print(controller.variants[0]["values"]
                                      //     [index]["image"]["url"]);
                                      // controller.options = controller.variants[0]
                                      //     ["values"][index]["options"];
                                      // print(controller.variants[0]["values"][index]
                                      //     ["options"]);
                                    },
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColor.geryinput),
                                                color: controller.variants[0]
                                                                    ["values"]
                                                                [index]
                                                            ["color_code"] !=
                                                        null
                                                    ? controller.hexToColor(
                                                        controller.variants[0]
                                                                    ["values"]
                                                                [index]
                                                            ["color_code"])
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              height: 50,
                                              width: 50,
                                            ),
                                            index == controller.selectindex
                                                ? Positioned(
                                                    top: 0,
                                                    right: 3,
                                                    child: Icon(
                                                      Icons.check,
                                                      size: 25,
                                                      color: Colors.green,
                                                    ))
                                                : SizedBox()
                                          ],
                                        ),

                                        // hereeeee
                                        // Text(controller.variants[0]["values"]
                                        //             [index]["value"] !=
                                        //         ""
                                        //     ? "${translateDatabase(controller.variants[0]["values"][index]["value"]["ar"], controller.variants[0]["values"][index]["value"]["en"])}"
                                        //     : controller.variants[0]["values"]
                                        //         [index]["value"])
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          controller.options.isNotEmpty
                              ? Row(
                                  children: [
                                    ...List.generate(
                                      controller.options.length,
                                      (index) => InkWell(
                                        onTap: () {
                                          controller.selectindexoptions = index;
                                          controller.changeoptions(
                                              controller.options[index]
                                                  ["image"],
                                              controller.options[index]["id"]);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(right: 5),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: controller
                                                              .selectindexoptions ==
                                                          index
                                                      ? AppColor.primaryColor
                                                      : Color(0xffE0E0E0)),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          height: 50,
                                          child: Text(
                                            // controller.options[index]
                                            //   ["value"]["en"]
                                            "${translateDatabase(controller.options[index]["value"]["ar"], controller.options[index]["value"]["en"])}",
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : SizedBox(),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: 20,
                )
              ],
            ));
  }
}
