import 'package:cached_network_image/cached_network_image.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  final void Function()? onTap;
  final String imageUrl;
  final String name;
  final String price;

  const ProductWidget({
    super.key,
    this.onTap,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  String _normalizeImageUrl(String url) {
    // استبدال جميع // بـ /، مع الحفاظ على https:// كما هي
    return url.replaceAll(RegExp(r'(?<!https:)/{2,}'), '/');
  }

  @override
  Widget build(BuildContext context) {
    final normalizedImageUrl = _normalizeImageUrl(imageUrl);

    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: normalizedImageUrl,
                maxHeightDiskCache: 500,
                maxWidthDiskCache: 500,
                memCacheHeight: 500,
                memCacheWidth: 500,
                filterQuality: FilterQuality.low,
                errorListener: (error) {
                  if (error.toString().contains("Invalid image data")) {
                    print("Error: Invalid image data detected");
                  }
                  print('Error loading image: $error');
                },
                placeholder: (context, url) => Image.asset(
                  AppImageAssets.coverproduct,
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Text(price,
                    style: TextStyle(fontSize: 14, color: Color(0xfff99c4f))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
