// ignore_for_file: prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:http_parser/http_parser.dart' as parser;

import '../../resources/components/imagepicker_component.dart';
import '../../utils/api_services/app_urls.dart';
import '../../utils/color_utils.dart';
import '../../utils/constant.dart';
import '../../utils/images/image_assets.dart';

class PHelpAndFeedbackController extends GetxController {
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  final imagePickerController = Get.put(ImagePickerController());

  postFeedback(context) async {
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
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token.toString(),
      };
      var request = http.MultipartRequest('POST', Uri.parse(UserUrls.helpAndFeedback));
      request.fields.addAll({'subject': subjectController.text, 'message': messageController.text});

      if (imagePickerController.selectedImages.length > 0) {
        for (var i = 0; i < imagePickerController.selectedImages.length; i++) {
          var multipartFile = await http.MultipartFile.fromPath(
            'help_and_feedback_images',
            imagePickerController.selectedImages[i].path,
            filename: imagePickerController.selectedImages[i].path.split('/').last,
            contentType: parser.MediaType("image", "${imagePickerController.selectedImages[i].path.split('.').last}"),
          );
          request.files.add(multipartFile);
        }
      }
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
                        "Thank You!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorUtils.black,
                          fontSize: 22.sp,
                        ),
                      ),
                      20.h.verticalSpace,
                      Text(
                        "Your Feedback has been submitted!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorUtils.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  SizedBox(
                    width: 1.0.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.close(3);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorUtils.red,
                            ),
                            child: Text(
                              "Go Back",
                              style: TextStyle(color: ColorUtils.white),
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
        Get.back();
        debugPrint(await response.stream.bytesToString());
        Get.snackbar("Alert", responseData['message'].toString(), backgroundColor: ColorUtils.white);
      }
    } catch (e) {
      Get.back();
      debugPrint("==> error: ${e.toString()}");
    }
  }
}
