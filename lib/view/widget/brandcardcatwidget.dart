import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/core/functions/responsive.dart';
import 'package:flutter/material.dart';

class BrandCardCatWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  const BrandCardCatWidget(
      {super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(),
      color: AppColor.white,
      surfaceTintColor: AppColor.white,
      shadowColor: Colors.grey, // لون الظل
      elevation: 2, // الارتفاع
      child: Container(
        padding: EdgeInsets.all(10),
        width: (MediaQuery.of(context).size.width / 2) - 20,
        height: 180,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                height: 70,
                width: 90,
                // padding: EdgeInsets.only(top: 2, right: 15, left: 15),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Image.asset(
                    AppImageAssets.logo,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12, color: AppColor.black, fontFamily: "inter"),
                  maxLines: 2, // تحديد عدد الأسطر المسموح بها
                  overflow: TextOverflow.ellipsis, // إضافة نقاط الانقطاع
                ),
              )
            ]),
      ),
    );
  }
}
