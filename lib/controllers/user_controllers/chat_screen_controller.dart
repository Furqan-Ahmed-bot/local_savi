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

  var performerId;
  var jobId;

  @override
  void onInit() {
    // showUserDetail.value = Get.arguments != null ? Get.arguments['showUserDetail'] : true;
    performerId = Get.arguments['providerId'];
    jobId = Get.arguments['jobId'];
    super.onInit();
  }

  assignJob(context) async {
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
      var request = http.Request('POST', Uri.parse("${UserUrls.assignJob}/b73883e1-b98b-42a8-ac2b-164961c00371"));
      request.body = json.encode({"decided_cost": int.parse(decidedAmountController.text), "performer_id": '34ce208e-311a-4847-86e9-cd3665ef02c2'});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        Get.close(1);
        String? clientSecret = responseData['data']['client_secret'];
        PaymentServices paymentServices = PaymentServices();
        await paymentServices.makePayment(clientSecret).then((value) => clientSecret = null).then((value) => Get.to(() {
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
                                ImageAssets.congratulationsIcon,
                                scale: 2,
                              ),
                            ),
                            20.h.verticalSpace,
                            Text(
                              "Congratulations!",
                              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                            ),
                            12.h.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "Your job has been posted successfully!",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
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
                                    // Get.toNamed(RouteName.jobPostedScreenPath,
                                    //     arguments: {
                                    //       'jobId': resposeDAta['data']['job_id']
                                    //     });
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
                        )
                      ],
                    );
                  });
            }));
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
