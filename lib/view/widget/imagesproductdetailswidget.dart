import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:elmahdy/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/view/widget/dotoffersswiperwidget.dart';

class ImagesProductDetailsWidget extends StatelessWidget {
  const ImagesProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    return GetBuilder<ProductDetailsController>(
        builder: (controller) => Container(
              height: MediaQuery.of(context).size.height * .4,
              width: double.infinity,
              color: AppColor.white,
              child: Stack(
                children: [
                  Swiper(
                    loop: false,
                    itemCount: controller.photo.length,
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.all(10),
                      builder: SwiperCustomPagination(
                        builder:
                            (BuildContext context, SwiperPluginConfig config) {
                          return DotOffersSwiperWidget(config: config);
                        },
                      ),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ClipRRect(
                          // borderRadius: BorderRadius.only(
                          //     bottomLeft: Radius.circular(20),
                          //     bottomRight: Radius.circular(20)),
                          child: Container(
                            child: CachedNetworkImage(
                              imageUrl: controller.photo[index]["url"],
                              fit: BoxFit.contain,
                              width: 300,
                              cacheManager: null,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ));
  }
}
