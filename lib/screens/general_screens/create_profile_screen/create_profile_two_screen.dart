// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/resources/components/back_appbar_button.dart';
import 'package:local_saviors/resources/components/p_bottom_nav_bar.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/general_screens/create_profile_screen/create_profile__two_controller.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import 'create_profile_controller.dart';

class CreateProfileTwoScreen extends GetWidget<CreatePorfileTwoController> {
  final createProfileController = Get.put(CreateProfileController());
  @override
  Widget build(BuildContext context) {
    log(controller.professionsList.length.toString());
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
                        // 110.verticalSpace,
                        const Text(
                          'Job Details',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        20.verticalSpace,
                        Container(
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
                              suffixIcon: Container(
                                child: Image.asset(
                                  ImageAssets.arrowDown,
                                  scale: 2,
                                ),
                              ),
                              hintText: 'Select Profession',
                              hintStyle: const TextStyle(
                                color: Color(0xffA5A5A5),
                              ), // Use hintText instead of labelText
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(bottom: 0, top: 7.0),
                            ),
                            value: controller.selectedProfession,
                            icon: const SizedBox.shrink(),
                            items: controller.proffesionsName
                                .map((options) => DropdownMenuItem(
                                      value: options,
                                      child: Text(
                                        options,
                                        style: const TextStyle(color: Color(0xffA5A5A5)),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              controller.selectProfessions(value);
                              controller.selectedProfession = value!;

                              controller.update();
                            },
                          ),
                        ),
                        12.verticalSpace,
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.professionsList.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: Key(controller.professionsList[index].dismissed),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                controller.unselectProfessions(controller.professionsList[index].dismissed);
                                controller.removeProfession(index);
                              },
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.red,
                                child: Icon(Icons.delete, color: Colors.white),
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
                                      value: controller.professionsList[index].dismissed, // Use the value from list
                                      icon: const SizedBox.shrink(),
                                      items: controller.proffesionsName
                                          .map((profession) => DropdownMenuItem(
                                                value: profession,
                                                child: Text(
                                                  profession,
                                                  style: const TextStyle(color: Color(0xffA5A5A5)),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          controller.professionsList[index].dismissed = value;
                                          controller.selectProfessions(value);
                                          controller.update();
                                        }
                                      },
                                    )),
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
                              )
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
                                  Container(
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
                                ],
                              )
                            : const SizedBox.shrink(),
                        // const Spacer(),

                        10.verticalSpace,
                        // 15.verticalSpace
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
                // Get.toNamed(RouteName.homeScreenPath);

                createProfileController.validation(context);
              }),
        ),
      ),
    );
  }
}
