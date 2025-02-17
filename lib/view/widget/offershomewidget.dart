import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:elmahdy/controller/home_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/view/widget/sectiontitleproductwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/view/widget/dotoffersswiperwidget.dart';

class OffersHomeWidget extends StatelessWidget {
  const OffersHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return GetBuilder<HomeController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.data.length == 0
                ? SizedBox()
                : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: SectionTitleProductWidget(
                          title: "SpecialOffers".tr,
                        ),
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //   color: AppColor.white,
                        //   borderRadius: BorderRadius.circular(32),
                        // ),
                        height: MediaQuery.of(context).size.height * .3,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            // Swiper for images
                            Swiper(
                              // curve: Curves.easeInOut,
                              autoplay: true,
                              itemCount: controller.data.length,
                              pagination: SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.all(10),
                                builder: SwiperCustomPagination(
                                  builder: (BuildContext context,
                                      SwiperPluginConfig config) {
                                    return DotOffersSwiperWidget(
                                        config: config);
                                  },
                                ),
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height:
                                      MediaQuery.of(context).size.height * .4,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),

                                    child: CachedNetworkImage(
                                      imageUrl: controller.data[index]["image"]
                                          ["url"],
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    //     Container(
                                    //   // margin: const EdgeInsets.symmetric(vertical: 15),
                                    //   child: Stack(
                                    //     children: [
                                    //       Container(
                                    //           alignment: Alignment.center,
                                    //           decoration: BoxDecoration(
                                    //             color: AppColor.offersbackground,
                                    //             borderRadius: BorderRadius.circular(32),
                                    //           ),
                                    //           //height: 150,
                                    //           child: Container(
                                    //             padding: EdgeInsets.all(30),
                                    //             child: Row(
                                    //               children: [
                                    //                 Column(
                                    //                   mainAxisAlignment:
                                    //                       MainAxisAlignment.spaceEvenly,
                                    //                   crossAxisAlignment:
                                    //                       CrossAxisAlignment.start,
                                    //                   children: [
                                    //                     Text(
                                    //                       "30%",
                                    //                       style: TextStyle(
                                    //                           fontSize: 25,
                                    //                           fontWeight: FontWeight.bold,
                                    //                           color:
                                    //                               AppColor.discountofferscolor),
                                    //                     ),
                                    //                     Text(
                                    //                       "Today’s Special",
                                    //                       style: TextStyle(
                                    //                           fontSize: 24,
                                    //                           fontWeight: FontWeight.bold,
                                    //                           color: AppColor.black),
                                    //                     ),
                                    //                     Container(
                                    //                       width: 250,
                                    //                       child: Text(
                                    //                         "get discount for every order, only valid for today",
                                    //                         style: TextStyle(
                                    //                             fontSize: 15,
                                    //                             fontWeight: FontWeight.bold,
                                    //                             color: AppColor.black),
                                    //                       ),
                                    //                     )
                                    //                   ],
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //           )),
                                    //       // Positioned(
                                    //       //   top: 1,
                                    //       //   right: 2,
                                    //       //   child: Container(
                                    //       //     height: double.infinity,
                                    //       //     width: 200,
                                    //       //     child: Image.asset(
                                    //       //       AppImageAssets.bag,
                                    //       //       fit: BoxFit.cover,
                                    //       //     ),
                                    //       //   ),
                                    //       // )
                                    //     ],
                                    //   ),
                                    // )
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )));
  }
}
