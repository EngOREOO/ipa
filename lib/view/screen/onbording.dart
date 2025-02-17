import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/controller/onbording_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/imageassets.dart';
import 'package:elmahdy/data/datasource/static.dart';
import 'package:elmahdy/view/widget/onbording/buttononbordingwidget.dart';
import 'package:elmahdy/view/widget/onbording/dotonbordingwidget.dart';
import 'package:elmahdy/view/widget/onbording/listonbordingwidget.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingController());
    return Scaffold(
      body: ListOnBordingWidget(),
    );
  }
}
