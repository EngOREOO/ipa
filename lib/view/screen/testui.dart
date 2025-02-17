// import 'package:elmahdy/core/constant/colors.dart';
// import 'package:elmahdy/core/constant/imageassets.dart';
// import 'package:elmahdy/core/functions/responsive.dart';
// import 'package:elmahdy/view/widget/cardcatwidget.dart';
// import 'package:elmahdy/view/widget/circlebackgroundcatwidget.dart';
// import 'package:elmahdy/view/widget/textbackgroundcatwidget.dart';
// import 'package:flutter/material.dart';

// class ListOnBordingWidgets extends StatelessWidget {
//   const ListOnBordingWidgets({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: AppColor.backgroundcate,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   color: AppColor.backgroundcate,
//                 ),
//                 CircleBackgroundCatWidget(
//                   top: -20,
//                   left: -30,
//                   width: 140,
//                   height: 140,
//                 ),
//                 CircleBackgroundCatWidget(
//                   top: 100,
//                   right: -40,
//                   width: 140,
//                   height: 140,
//                 ),
//                 TextBackgroundCatWidget(text: "Categories")
//               ],
//             ),
//             Expanded(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: AppColor.offwhite,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(20),
//                     topLeft: Radius.circular(20),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
//                   child: GridView.builder(
//                     itemCount: 10,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 35,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemBuilder: (BuildContext context, int index) {
//                       return CardCatWidget(text: "kll");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
