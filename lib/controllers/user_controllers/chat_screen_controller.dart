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
import '../../utils/payment_intent/payment_intent.dart';

class ChatScreenController extends GetxController {
  RxBool isPendingJob = false.obs;
  RxBool showUserDetail = true.obs;
  final decidedAmountController = TextEditingController();

  var username;
  var performerId;
  var jobId;
  var profile_picture;

  @override
  void onInit() {
    // showUserDetail.value = Get.arguments != null ? Get.arguments['showUserDetail'] : true;
    performerId = Get.arguments['providerId'] ?? '';
    jobId = Get.arguments['jobId'] ?? '';
    username = Get.arguments['username'] ?? 'XYZ';
    super.onInit();
  }

  assignJob(BuildContext context) async {
    try {
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from dismissing the dialog
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: SizedBox(
              child: spinkit, // Assuming spinkit is a loading indicator widget
            ),
          );
        },
      );

      // Prepare the request
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token.value,
      };
      var request = http.Request(
        'POST',
        Uri.parse("${UserUrls.assignJob}/$jobId"),
      );
      request.body = json.encode({
        "decided_cost": int.parse(decidedAmountController.text),
        "performer_id": performerId,
      });
      request.headers.addAll(headers);

      // Send the request
      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      // Close the loading dialog
      Navigator.of(context).pop();

      if (response.statusCode == 200) {
        String? clientSecret = responseData['data']['client_secret'];
        PaymentServices paymentServices = PaymentServices();

        // Make payment
        await paymentServices.makePayment(clientSecret);

        // Show success dialog
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.jobIconBG,
                      ),
                      child: Image.asset(
                        ImageAssets.congratulationsIcon,
                        scale: 2,
                      ),
                    ),
                    20.h.verticalSpace,
                    Text(
                      "Congratulations!",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    12.h.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        "Your job has been posted successfully!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
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
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorUtils.red,
                            ),
                            child: Text(
                              "View Job Details",
                              style: TextStyle(color: ColorUtils.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      } else {
        // Handle error
        Get.snackbar(
          "Alert",
          responseData['message'].toString(),
          backgroundColor: ColorUtils.white,
        );
      }
    } catch (e) {
      // Close the loading dialog in case of error
      Navigator.of(context).pop();
      debugPrint("==> error: ${e.toString()}");
    }
  }
}
