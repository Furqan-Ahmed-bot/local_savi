// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:local_saviors/resources/components/back_appbar_button.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/general_screens/create_profile_screen/create_handyman_profile_controller.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import '../../../resources/components/imagepicker_component.dart';
import 'create_profile_controller.dart';

class CreateHandymanProfile extends GetWidget<CreateHandymanPorfileController> {
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
                          itemCount: controller.categoryList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              key: Key(controller.categoryList[index].id.toString()), // Unique key
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      controller.unselectProfessions(controller.categoryList[index].dismissed);
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
                                      hintText: 'Select Category',
                                      hintStyle: const TextStyle(
                                        color: Color(0xffA5A5A5),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(bottom: 0, top: 7.0),
                                    ),
                                    value: controller.categoryList[index].dismissed,
                                    icon: const SizedBox.shrink(),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'Select Category',
                                        child: Text(
                                          'Select Category',
                                          style: const TextStyle(color: Color(0xffA5A5A5)),
                                        ),
                                      ),
                                      ...controller.proffesionsName
                                          .where((profession) => profession != 'Select Category') // Exclude duplicates
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
