import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitAPP() {
  return Get.defaultDialog(
      title: "Alert",
      middleText: "are u want exit app?",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("confirm")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("cancel")),
      ]);
  //return Future.value(true);
}
