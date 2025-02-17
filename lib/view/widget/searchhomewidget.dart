import 'package:elmahdy/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:get/get.dart';

class SearchHomeWidget extends StatelessWidget {
  final Function(String)? onFieldSubmitted;
  const SearchHomeWidget({
    Key? key,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
