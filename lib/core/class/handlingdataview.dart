import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/imageassets.dart';

//view
class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAssets.lampload,
                width: 250,
                height: 250,
                frameRate: FrameRate.max,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: 250, height: 250))
                // : statusRequest == StatusRequest.failure
                //     ? Center(
                //         child: Lottie.asset(AppImageAssets.nodata,
                //             width: 250, height: 250))
                : widget;
  }
}

//Rrquset
class HandlingDataReq extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataReq(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: 250, height: 250))
                : widget;
  }
}
