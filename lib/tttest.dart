// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:elmahdy/bindings/intialbinding.dart';
// import 'package:elmahdy/core/constant/colors.dart';
// import 'package:elmahdy/core/localization/changelocal.dart';
// import 'package:elmahdy/core/localization/translation.dart';
// import 'package:elmahdy/core/services/services.dart';
// import 'package:elmahdy/routes.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initialServices();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     localeController controller = Get.put(localeController());
//     return GetMaterialApp(
//       initialBinding: IntialBindings(),
//       locale: controller.language,
//       translations: Mytranslation(),
//       debugShowCheckedModeBanner: false,
//       getPages: routes,
//     );
//   }
// }










// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:elmahdy/bindings/intialbinding.dart';
// import 'package:elmahdy/core/constant/colors.dart';
// import 'package:elmahdy/core/localization/changelocal.dart';
// import 'package:elmahdy/core/localization/translation.dart';
// import 'package:elmahdy/core/services/services.dart';
// import 'package:elmahdy/routes.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initialServices();
//   runApp(DevicePreview(builder: (context) => MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     localeController controller = Get.put(localeController());
//     return GetMaterialApp(
//       builder: DevicePreview.appBuilder,
//       initialBinding: IntialBindings(),
//       locale: controller.language,
//       translations: Mytranslation(),
//       debugShowCheckedModeBanner: false,
//       getPages: routes,
//     );
//   }
// }
