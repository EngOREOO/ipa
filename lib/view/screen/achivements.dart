import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AchivementsPage extends StatelessWidget {
  const AchivementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("achivements".tr),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Text("انجازات المهدي لا تتوقف, نحن مشغولون بعرضها"),
      ),
    );
  }
}
