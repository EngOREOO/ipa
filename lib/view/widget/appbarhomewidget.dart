import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/controller/mainpage_controller.dart';
import 'package:elmahdy/core/constant/imageassets.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainPageController controller = Get.put(MainPageController());
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            controller.scafoldkey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu)),
      title: Container(
        width: 100,
        height: 100,
        child: Image.asset(
          AppImageAssets.logo,
          fit: BoxFit.contain,
        ),
      ),
      // actions: [
      //   Container(
      //       margin: EdgeInsets.symmetric(horizontal: 15),
      //       child: Icon(Icons.settings))
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
