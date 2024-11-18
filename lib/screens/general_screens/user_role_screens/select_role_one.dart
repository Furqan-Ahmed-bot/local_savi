// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/screens/general_screens/pre_login_screen/pre_login_screen.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/role_one_controller.dart';
import 'package:local_saviors/screens/general_screens/user_role_screens/select_role_two.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/routes/routes.dart';
import '../../../resources/components/select_role_widet.dart';
import '../../../utils/images/image_assets.dart';

class SelectUserRoleOne extends GetWidget<RoleOneController> {
  const SelectUserRoleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Select Role',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              20.verticalSpace,
              Text(
                'Select Role to Continue!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              20.verticalSpace,
              Container(
                color: Colors.red,
                height: 5,
                width: 50,
              ),
              40.verticalSpace,
              SelectRoleWidget(
                onTap: () {
                  role.value = "user";

                  Get.toNamed(RouteName.prelogin);
                },
                title: 'Continue as a Job Provider',
                icon: ImageAssets.jobprovider,
              ),
              20.verticalSpace,
              SelectRoleWidget(
                onTap: () {
                  Get.toNamed(RouteName.selectRoleTwo);
                },
                title: 'Continue as a Job Performer',
                icon: ImageAssets.performer,
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    Text(
                      'By signing-in, you agree to our',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    5.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.termsAndConditionScreenPath);
                          },
                          child: Text(
                            'Terms & Conditions',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '  |  ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.privacyPolicyScreenPath);
                          },
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              15.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
