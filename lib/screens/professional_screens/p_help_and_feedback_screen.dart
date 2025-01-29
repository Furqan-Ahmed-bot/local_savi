// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_help_and_feedback_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../resources/components/imagepicker_component.dart';

class PHelpAndFeedbackScreen extends GetWidget<PHelpAndFeedbackController> {
  final imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Submit",
            onPress: () {
              if (controller.subjectController.text.isEmpty) {
                Get.snackbar('Warning', 'Please Enter Subject');
              } else if (controller.messageController.text.isEmpty) {
                Get.snackbar('Warning', 'Please Enter Subject');
              } else {
                controller.postFeedback(context);
              }
            }),
      ),
      body: myBackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            isMenu: false,
            title: "Job Details",
          ),
          20.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditText(
                  hintText: "Subject",
                  context: context,
                  bordercolor: Colors.transparent,
                  controller: controller.subjectController,
                ),
                20.h.verticalSpace,
                EditText(
                  hintText: "Type your message here...",
                  minLines: 7,
                  maxLines: 7,
                  context: context,
                  bordercolor: Colors.transparent,
                  controller: controller.messageController,
                ),
                20.h.verticalSpace,
                Obx(
                  () => GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imagePickerController.selectedImages.length + 1,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      if (index == imagePickerController.selectedImages.length) {
                        // Add new image button
                        return GestureDetector(
                          onTap: () {
                            imagePickerController.pickImages(isMultiImage: true);
                          },
                          child: DottedBorder(
                            radius: Radius.circular(15.r),
                            borderType: BorderType.RRect,
                            strokeCap: StrokeCap.round,
                            dashPattern: const [5, 5],
                            strokeWidth: 1.5,
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorUtils.red,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    5.verticalSpace,
                                    Image.asset(
                                      ImageAssets.addCircleRed,
                                      scale: 2.5,
                                      color: Colors.white,
                                    ),
                                    5.verticalSpace,
                                    Text(
                                      'Add',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        // Display selected image
                        final imagePath = imagePickerController.selectedImages[index];
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imagePath.path.startsWith('http')
                                      ? NetworkImage(imagePath.path) as ImageProvider
                                      : FileImage(File(imagePath.path)),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: GestureDetector(
                                onTap: () {
                                  imagePickerController.removeImage(index);
                                },
                                child: SizedBox(
                                  height: 25.h,
                                  width: 25.w,
                                  child: Image.asset(
                                    ImageAssets.bigCross,
                                    scale: 2.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
