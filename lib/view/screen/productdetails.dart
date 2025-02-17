import 'package:card_swiper/card_swiper.dart';
import 'package:elmahdy/controller/productdetails_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/view/widget/customconnectbuttonwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/view/widget/detailswidget.dart';
import 'package:elmahdy/view/widget/imagesproductdetailswidget.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.all(7),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColor.white),
              child: Icon(
                Icons.arrow_back,
                color: AppColor.black,
              ),
            ),
          ),
        ),
        bottomNavigationBar: GetBuilder<ProductDetailsController>(
            builder: (controller) => controller.statusRequest ==
                    StatusRequest.success
                ? Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 9,
                        blurRadius: 9,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: BottomAppBar(
                      elevation: 0,
                      color: AppColor.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomConnectButtonWidget(
                              width: MediaQuery.of(context).size.width * 0.15,
                              bordercolor: AppColor.scoundColor,
                              widget: controller.isfav == false
                                  ? Icon(
                                      Icons.favorite_border,
                                      color: AppColor.scoundColor,
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: AppColor.scoundColor,
                                    ),
                              text: "",
                              ontap: () {
                                controller.addtofav();
                              }),
                          CustomConnectButtonWidget(
                              bordercolor: AppColor.scoundColor,
                              width: MediaQuery.of(context).size.width * 0.15,
                              widget: Icon(
                                Icons.share_outlined,
                                color: AppColor.scoundColor,
                              ),
                              text: "",
                              textcolor: AppColor.scoundColor,
                              ontap: () {
                                Share.share(
                                    ' https://www.elmahdy-techno-light.com/ar/product/details/${controller.product["id"]}',
                                    subject:
                                        "${controller.product["name"]["en"]}");
                              }),
                          CustomConnectButtonWidget(
                              width: MediaQuery.of(context).size.width * 0.55,
                              color: AppColor.black,
                              bordercolor: AppColor.black,
                              textcolor: AppColor.white,
                              widget: Icon(
                                Icons.shopping_cart,
                                color: AppColor.white,
                              ),
                              text: "AddToCart".tr,
                              ontap: () async {
                                controller.addtoCart();
                              }),
                        ],
                      ),
                    ),
                  )
                : SizedBox()),
        body: GetBuilder<ProductDetailsController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    physics: ClampingScrollPhysics(),
                    children: [
                      ImagesProductDetailsWidget(),
                      Container(
                        padding: EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 25,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [DetailsWidget()],
                        ),
                      )
                    ],
                  ),
                )));
  }
}
