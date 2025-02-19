import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import "package:http/http.dart" as http;

import '../../utils/api_services/app_urls.dart';
import '../../utils/color_utils.dart';
import '../../utils/constant.dart';
import '../../utils/images/image_assets.dart';
import '../../utils/routes/routes.dart';

class OngoingJobDetailScreenController extends GetxController {
  RxString jobId = "".obs;
  var jobDetailDatail = {};
  RxBool isLoading = false.obs;

  getData() async {
    isLoading.value = true;
    await UserServices.instance.getSingleJobDetail(jobId: jobId.value).then((value) {
      isLoading.value = false;
      jobDetailDatail = value['job'];
      log("==> jobDetails: ${jobDetailDatail}");
      update();
    });
    isLoading.value = false;

    // update();
  }

  RxBool isReached = false.obs;
  List dummyData = [
    {
      "title": "Work Type",
      "value": "Professional",
    },
    {
      "title": "Job Budget",
      "value": "\$ 50.00 / hr",
    },
    {
      "title": "Job Time",
      "value": "03:00 pm",
    },
    {
      "title": "Job Date",
      "value": "May 18, 2024",
    },
    {
      "title": "Job Address",
      "value": "204 N Auburn Ave, Farmington, New York, 87401",
    },
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    jobId.value = Get.arguments['jobId'] ?? "";

    getData();
    isReached.value = Get.arguments != null ? Get.arguments['isReached'] ?? false : false;
  }

  payNow(context, performerData) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: SizedBox(
                child: spinkit,
              ),
            );
          });
      var headers = {'Content-Type': 'application/json', 'Authorization': token.value};
      var request = http.Request('POST', Uri.parse("${UserUrls.payNow}/${jobId.value}"));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                backgroundColor: ColorUtils.dialogeBGColor,
                content: SizedBox(
                  width: 1.0.sw,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      20.h.verticalSpace,
                      Container(
                        padding: EdgeInsets.all(23.sp),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: ColorUtils.jobIconBG),
                        child: Image.asset(
                          ImageAssets.jobDoneIcon,
                          scale: 2,
                        ),
                      ),
                      20.h.verticalSpace,
                      Text(
                        "Job Done!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorUtils.black,
                          fontSize: 22.sp,
                        ),
                      ),
                      24.h.verticalSpace,
                      Text(
                        "Payment transfer successfully!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorUtils.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Container(
                    width: 1.0.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.close(2);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(width: 1.w, color: ColorUtils.borderColor)),
                              child: const Text("Go back"),
                            ),
                          ),
                        ),
                        20.w.horizontalSpace,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.close(2);
                              Get.offAndToNamed(RouteName.rateEmployeeScreenPath, arguments: {'performer_details': performerData});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorUtils.red,
                              ),
                              child: Text(
                                "Rate Employee",
                                style: TextStyle(color: ColorUtils.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            });
      } else {
        responseData['message'];
        Get.close(1);
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.close(1);
      debugPrint("==> error: ${e.toString()}");
    }
  }
}
