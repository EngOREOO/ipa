import 'package:elmahdy/controller/contacts_controller.dart';
import 'package:elmahdy/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class ConcetUsPage extends StatelessWidget {
  const ConcetUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ContactUsController controller = Get.put(ContactUsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("ContactUs".tr),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.geryinput,
                    borderRadius: BorderRadius.circular(12)),
                height: 200,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.location_on,
                    //   color: AppColor.scoundColor,
                    //   size: 30,
                    // ),
                    SizedBox(height: 10),
                    Text(
                      "عنواننا",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "الغربية - المحلة الكبري إمتداد شارع شكري القوتلي بعد سور نادي البلدية بجوار غزال للفطائر و البيتزا",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.geryinput,
                    borderRadius: BorderRadius.circular(12)),
                height: 200,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.location_on,
                    //   color: AppColor.scoundColor,
                    //   size: 30,
                    // ),
                    SizedBox(height: 10),
                    Text(
                      "ساعات العمل",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "من السبت للخميس الساعه 9 صباحا حتي الساعه 6 مسائا",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              ...List.generate(
                  controller.phones.length,
                  (index) => InkWell(
                        onTap: () async {
                          bool? res = await FlutterPhoneDirectCaller.callNumber(
                              controller.phones[index]["body"]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone,
                                color: AppColor.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                controller.phones[index]["body"],
                                style: TextStyle(color: AppColor.white),
                              ),
                            ],
                          ),
                        ),
                      ))
            ],
          )),
    );
  }
}
