import 'package:elmahdy/controller/cart_controller.dart';
import 'package:elmahdy/core/functions/validinput.dart';
import 'package:elmahdy/view/widget/textfaildaddinfowidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddInfoOrderWidget extends StatelessWidget {
  const AddInfoOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());

    return Container(
        width: MediaQuery.of(context).size.height - 15,
        height: 450,
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              TextFiledAddinfoWidget(
                mycontroller: controller.state,
                maxLines: 1,
                obscureText: false,
                valid: (val) {
                  return validInputemp(
                    val!,
                    1,
                    50,
                  );
                },
                title: "State".tr,
              ),
              SizedBox(height: 10),
              TextFiledAddinfoWidget(
                mycontroller: controller.city,
                maxLines: 1,
                obscureText: false,
                valid: (val) {
                  return validInputemp(
                    val!,
                    1,
                    50,
                  );
                },
                title: "City".tr,
              ),
              SizedBox(height: 10),
              TextFiledAddinfoWidget(
                mycontroller: controller.street,
                maxLines: 1,
                obscureText: false,
                valid: (val) {
                  return validInputemp(
                    val!,
                    1,
                    500,
                  );
                },
                title: "Street".tr,
              ),
              SizedBox(height: 10),
              TextFiledAddinfoWidget(
                hint: "optional".tr,
                mycontroller: controller.code,
                maxLines: 1,
                obscureText: false,
                valid: (val) {
                  return validInputemp(
                    val!,
                    0,
                    500,
                  );
                },
                title: "discountcode".tr,
              ),
              SizedBox(height: 10),
              TextFiledAddinfoWidget(
                mycontroller: controller.notes,
                maxLines: 3,
                obscureText: false,
                valid: (val) {
                  return validInputemp(
                    val!,
                    0,
                    500,
                  );
                },
                title: "Notes".tr,
              ),
            ],
          ),
        ));
  }
}
