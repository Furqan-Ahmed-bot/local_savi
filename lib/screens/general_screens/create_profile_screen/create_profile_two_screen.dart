// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:local_saviors/resources/components/back_appbar_button.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/general_screens/create_profile_screen/create_profile__two_controller.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../../resources/components/imagepicker_component.dart';
import '../../../utils/constant.dart';
import 'create_profile_controller.dart';

class CreateProfileTwoScreen extends GetWidget<CreatePorfileTwoController> {
  final createProfileController = Get.put(CreateProfileController());
  final imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFD6EFFF), // Light blue shade for the top
            Color(0xFFFFFFFF), // White shade for the bottom
          ],
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButtonWidget(
            onTap: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Job Details',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        20.verticalSpace,
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.professionsList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              key: Key(controller.professionsList[index].id.toString()), // Unique key
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      controller.unselectProfessions(controller.professionsList[index].dismissed);
                                      controller.removeProfession(index);
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Container(
                                  height: 0.07.sh,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: const Color(0xffDBE2EC)),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      suffixIcon: Image.asset(
                                        ImageAssets.arrowDown,
                                        scale: 2,
                                      ),
                                      hintText: 'Select Profession',
                                      hintStyle: const TextStyle(
                                        color: Color(0xffA5A5A5),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(bottom: 0, top: 7.0),
                                    ),
                                    value: controller.professionsList[index].dismissed,
                                    icon: const SizedBox.shrink(),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'Select Profession',
                                        child: Text(
                                          'Select Profession',
                                          style: const TextStyle(color: Color(0xffA5A5A5)),
                                        ),
                                      ),
                                      ...controller.proffesionsName
                                          .where((profession) => profession != 'Select Profession') // Exclude duplicates
                                          .map((profession) => DropdownMenuItem(
                                                value: profession,
                                                child: Text(
                                                  profession,
                                                  style: const TextStyle(color: Color(0xffA5A5A5)),
                                                ),
                                              )),
                                    ],
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectProfessions(value, index); // Pass the index
                                        controller.update();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        5.verticalSpace,
                        InkWell(
                          onTap: () {
                            controller.addProfession();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                ImageAssets.addCircleRed,
                                scale: 2,
                              ),
                              10.horizontalSpace,
                              Text(
                                "Add More",
                                style: TextStyle(fontSize: 16.sp, color: ColorUtils.red),
                              ),
                            ],
                          ),
                        ),
                        5.verticalSpace,

                        role.value == "PROFESSIONAL"
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.verticalSpace,
                                  const Text(
                                    'Professional Documents',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  20.verticalSpace,
                                  imagePickerController.selectedImages.isEmpty
                                      ? InkWell(
                                          onTap: () {
                                            imagePickerController.pickImages(isMultiImage: true);
                                          },
                                          child: Container(
                                            height: 0.4.sw,
                                            width: 1.0.sw,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.r),
                                              border: Border.all(width: 0.5, color: ColorUtils.borderColor),
                                              color: ColorUtils.white,
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  ImageAssets.helpFeedbackAdd,
                                                  scale: 2,
                                                ),
                                                Text(
                                                  "Upload Documents",
                                                  style: TextStyle(fontSize: 14.sp, color: ColorUtils.txtLightGrey),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : Obx(
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
                              )
                            : const SizedBox.shrink(),

                        // Other UI elements...
                      ],
                    ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 12.0.w,
            right: 12.0.w,
            bottom: 40.0.h,
          ),
          child: RoundButton(
              buttonColor: const Color(0xffE50000),
              height: 40,
              width: 0.9.sw,
              title: 'Continue',
              onPress: () {
                createProfileController.validation(context);
              }),
        ),
      ),
    );
  }
}
