import 'package:elmahdy/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/view/widget/auth/bottombuttonauthwidget.dart';
import 'package:elmahdy/view/widget/auth/buttonauthwidget.dart';

import '../../widget/auth/textfieldloginwidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BottomButtonAuthWidget(
          text: "don'thaveanaccount".tr,
          textbutton: "SignUp".tr,
          onTap: () {
            Get.offNamed(AppRoutes.signup);
          },
        ),
        backgroundColor: AppColor.white,
        body: GetBuilder<LoginController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WelcomeBack".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          Text(
                            "LogintoYourAccount".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.4,
                            ),
                          ),
                          const SizedBox(height: 85),
                          Form(
                            key: controller.formState,
                            child: Column(
                              children: [
                                TextFieldLoginWidget(
                                  mycontroller: controller.email,
                                  labletext: "EmailorPhone".tr,
                                  valid: (val) {
                                    return validInput(
                                      val!,
                                      5,
                                      30,
                                    );
                                  },
                                ),
                                SizedBox(height: 40),
                                TextFieldLoginWidget(
                                  scureText: controller.isshowpassword,
                                  mycontroller: controller.password,
                                  labletext: "password".tr,
                                  icon: IconButton(
                                      onPressed: () {
                                        controller.showpassword();
                                      },
                                      icon: Icon(Icons.lock)),
                                  valid: (val) {
                                    return validInput(val!, 0, 200, "password");
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // InkWell(
                                    //   onTap: () {},
                                    //   child: Text(
                                    //     "Forget password?",
                                    //     style: TextStyle(
                                    //         fontSize: 13,
                                    //         fontFamily: "inter",
                                    //         fontWeight: FontWeight.w700),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                SizedBox(height: 50),
                                buttonauthwidget(
                                    onTap: () {
                                      controller.login();
                                    },
                                    text: "Login".tr),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      )),
                )

            ///
            ));
  }
}
