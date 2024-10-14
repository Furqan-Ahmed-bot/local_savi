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

class CreateProfileTwoScreen extends GetWidget<CreatePorfileTwoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButtonWidget(
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              110.verticalSpace,
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
                  items: ['Profession 1', 'Profession 2', 'Profession 3']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(
                              gender,
                              style: const TextStyle(color: Color(0xffA5A5A5)),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedProfession = value!;
                    controller.update();
                  },
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  Container(
                    width: 0.73.sw,
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
                        contentPadding:
                            const EdgeInsets.only(bottom: 0, top: 7.0),
                      ),
                      value: controller.selectedProfession2,
                      icon: const SizedBox.shrink(),
                      items: ['Profession 1', 'Profession 2', 'Profession 3']
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(
                                  gender,
                                  style:
                                      const TextStyle(color: Color(0xffA5A5A5)),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.selectedProfession2 = value!;
                        controller.update();
                      },
                    ),
                  ),
                  Container(
                    height: 0.07.sh,
                    // width: 0.2.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorUtils.trakNowbgColor),
                    child: Image.asset(
                      ImageAssets.deleteIcon,
                      scale: 2,
                      color: ColorUtils.black,
                    ),
                  )
                ],
              ),
              20.verticalSpace,
              Row(
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

              role.value == "professional"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        const Text(
                          'Professional Documents',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        20.verticalSpace,
                        Container(
                          height: 0.4.sw,
                          width: 1.0.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                width: 0.5, color: ColorUtils.borderColor),
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
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorUtils.txtLightGrey),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              const Spacer(),

              RoundButton(
                  buttonColor: const Color(0xffE50000),
                  height: 40,
                  width: 0.9.sw,
                  title: 'Continue',
                  onPress: () {
                    // Get.toNamed(RouteName.homeScreenPath);

                    Get.to(PBottomNavBar());
                  }),
              30.verticalSpace,
              // 15.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
