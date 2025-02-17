import 'package:elmahdy/controller/signup_controller.dart';
import 'package:elmahdy/core/class/handlingdataview.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/view/widget/auth/bottombuttonauthwidget.dart';
import 'package:elmahdy/view/widget/auth/buttonauthwidget.dart';
import 'package:elmahdy/view/widget/auth/textfieldsignupwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignupController());
    return Scaffold(
        // extendBodyBehindAppBar: true,
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: BottomButtonAuthWidget(
            text: "Youalreadyhaveanaccount?".tr,
            textbutton: "Login".tr,
            onTap: () {
              Get.offNamed(AppRoutes.login);
            },
          ),
        ),
        backgroundColor: AppColor.white,
        body: GetBuilder<SignupController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  child: ListView(
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 110),
                      Text(
                        "SignUp".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.scoundColor,

                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          // shadows: [
                          //   Shadow(
                          //     color: Colors.grey,
                          //     offset: Offset(0.73, 2.2),
                          //     blurRadius: 2.93,
                          //   )
                          // ]
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Enteryourdetails".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.black,

                          fontWeight: FontWeight.w600,
                          fontSize: 17.4,
                          // shadows: [
                          //   Shadow(
                          //     color: Colors.grey, // لون الظل
                          //     offset: Offset(0.41, 1.23), // الإزاحة الأفقية والرأسية
                          //     blurRadius: 1.64, // نصف قطر الانعكاس
                          //   )
                          // ]
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Form(
                          key: controller.formState,
                          child: Column(
                            children: [
                              TextFieldSignupWidget(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                mycontroller: controller.name,
                                labletext: "Name".tr,
                                valid: (val) {
                                  return validInput(val!, 2, 50, "name");
                                },
                              ),
                              SizedBox(height: 30),
                              TextFieldSignupWidget(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                mycontroller: controller.email,
                                labletext: "Email".tr,
                                valid: (val) {
                                  return validInput(val!, 2, 50, "email");
                                },
                              ),
                              SizedBox(height: 30),
                              TextFieldSignupWidget(
                                keyboardType: TextInputType.phone,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                mycontroller: controller.phone,
                                labletext: "phone".tr,
                                valid: (val) {
                                  return validInput(val!, 2, 50, "phone");
                                },
                              ),
                              SizedBox(height: 30),
                              TextFieldSignupWidget(
                                icon: IconButton(
                                    onPressed: () {
                                      controller.showpassword();
                                    },
                                    icon: Icon(Icons.lock)),
                                scureText: controller.isshowpassword,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                mycontroller: controller.password,
                                labletext: "password".tr,
                                valid: (val) {
                                  return validInput(val!, 2, 50, "");
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 90),
                        child: buttonauthwidget(
                          onTap: () {
                            controller.register();
                          },
                          text: "register".tr,
                          textcolor: AppColor.white,
                          color: AppColor.scoundColor,
                          width: 169,
                          height: 49,
                        ),
                      ),
                      SizedBox(height: 33),
                      // Custtombackbar(onPressed: () {
                      //   Get.back();
                      // })
                    ],
                  ),
                ))));
  }
}
