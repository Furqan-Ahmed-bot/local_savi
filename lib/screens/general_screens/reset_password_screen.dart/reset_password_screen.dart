// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/general_screens/reset_password_screen.dart/reset_password_controller.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import '../../../resources/components/back_appbar_button.dart';
import '../../../resources/components/text_fields.dart';
import '../../../utils/images/image_assets.dart';

class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButtonWidget(
          onTap: () {
            Get.close(2);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              110.verticalSpace,
              Center(
                child: Image.asset(
                  ImageAssets.coloredlogo,
                  scale: 3.5,
                ),
              ),
              50.verticalSpace,
              Text(
                'Reset Password',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              20.verticalSpace,
              Text(
                'Set your new password',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              20.verticalSpace,
              Container(
                color: ColorUtils.red,
                height: 5,
                width: 50,
              ),
              40.verticalSpace,
              AuthTextField(
                hint: 'Password',
                icon: ImageAssets.password,
                controller: controller.passwordController,
                hintColor: Color(0xffA5A5A5),
              ),
              20.verticalSpace,
              AuthTextField(
                hint: 'Reset Password',
                icon: ImageAssets.password,
                controller: controller.confirmPasswordController,
                hintColor: Color(0xffA5A5A5),
              ),
              40.verticalSpace,
              RoundButton(
                  buttonColor: Color(0xffE50000),
                  height: 40,
                  width: 0.9.sw,
                  title: 'Reset',
                  onPress: () {
                    if (controller.passwordController.text.isNotEmpty) {
                      if (controller.passwordController.text.isNotEmpty) {
                        if (controller.passwordController.text ==
                            controller.confirmPasswordController.text) {
                          UserServices.instance.resetPasswordService(
                              context: context,
                              password: controller.passwordController.text);
                        } else {
                          Get.snackbar("Alert", "Password does not match",
                              backgroundColor: ColorUtils.white);
                        }
                      } else {
                        Get.snackbar(
                            "Alert", "Please enter your confirm password",
                            backgroundColor: ColorUtils.white);
                      }
                    } else {
                      Get.snackbar("Alert", "Please enter your password",
                          backgroundColor: ColorUtils.white);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
