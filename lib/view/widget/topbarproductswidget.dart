import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TopbarProductsWidget extends StatelessWidget {
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  const TopbarProductsWidget({
    Key? key,
    this.onFieldSubmitted,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            textInputAction: TextInputAction.search,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 26,
              ),

              // helperText: "Search your topic",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: "searchproducts".tr,
              labelStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              isDense: true,
            ),
          ),
        ),
        // SizedBox(width: 10),
        // Container(
        //   padding: EdgeInsets.all(9),
        //   width: 50,
        //   height: 55,
        //   decoration: BoxDecoration(
        //       border: Border.all(color: AppColor.black),
        //       borderRadius: BorderRadius.circular(12)),
        //   child: SvgPicture.asset(
        //     AppImageAssets.filter,
        //     colorFilter: ColorFilter.mode(AppColor.black, BlendMode.srcIn),
        //   ),
        // )
      ],
    );
  }
}
