// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/setting_controllers/privacy_policy_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:html2md/html2md.dart' as html2md;

import '../../utils/constant.dart';

class PrivacyPolicyScreen extends GetWidget<PrivacyPolicyController> {
  String markdown = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            isMenu: false,
            title: "Privacy Policy",
          ),
          20.h.verticalSpace,
          Expanded(
            child: Obx(() {
              markdown = controller.isLoading.value ? html2md.convert('') : html2md.convert(controller.privacypolicy['data']);
              return controller.isLoading.value
                  ? spinkit
                  : ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: 0.8.sh,
                                height: 0.81.sh,
                                child: SingleChildScrollView(
                                  child: MarkdownBody(
                                    data: markdown,
                                    styleSheet: MarkdownStyleSheet(
                                        h1: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff444444),
                                        ),
                                        p: TextStyle(
                                          fontSize: 17.sp,
                                          color: Colors.black,
                                        ),
                                        listBullet: TextStyle(
                                          fontSize: 25,
                                          color: Colors.grey,
                                        )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        30.verticalSpace
                      ],
                    );
            }),
          ),
        ],
      )),
    );
  }
}
