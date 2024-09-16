import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/p_home_controller.dart';
import 'package:local_saviors/resources/components/text_fields.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class PHomeScreen extends GetWidget<PHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, bottom: 110.h, top: 20.h),
              children: [
                Column(
                  children: [
                    AuthTextField(
                      hint: "Search",
                      suffixIcon: ImageAssets.filterIcon,
                    ),
                    20.h.verticalSpace,
                    Column(
                      children: List.generate(3, (index) => applyJobCard()),
                    )
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
