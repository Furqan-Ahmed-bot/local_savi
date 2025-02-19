// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

import '../../utils/api_services/app_urls.dart';
import '../../utils/color_utils.dart';
import '../../utils/constant.dart';
import '../../utils/images/image_assets.dart';

class RateEmployeeScreenController extends GetxController {
  RxDouble ratingValue = 3.0.obs;
  final reviewController = TextEditingController();

  var performerdetails;

  @override
  void onInit() {
    performerdetails = Get.arguments['performer_details'];
    super.onInit();
  }

  addReview(context) async {
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
      var request = http.Request('POST', Uri.parse("${UserUrls.giveReview}/${performerdetails['performer_id']}"));
      request.body = json.encode({"stars": ratingValue.value, "review": reviewController.text});
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            ImageAssets.cutIcon,
                            scale: 2,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(23.sp),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: ColorUtils.jobIconBG),
                        child: Image.asset(
                          ImageAssets.shareIcon,
                          scale: 2,
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
                              Get.close(3);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: ColorUtils.red,
                              ),
                              child: Text(
                                "ThankYou For Sharing Your Experience!",
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
        // addbank(responseData['data']);
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
