import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';

class RowSubCategoriesWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final void Function()? onTap;
  final Color color;
  const RowSubCategoriesWidget(
      {super.key,
      required this.imageUrl,
      required this.name,
      this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: color)),
              padding: EdgeInsets.all(13),
              width: 75,
              height: 75,
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontFamily: "opensans",
                color: AppColor.categoriesnamecolor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
