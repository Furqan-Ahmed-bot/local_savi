import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/setting_controllers/terms_condition_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';

class TermsConditionScreen extends GetWidget<TermsConditionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(
            isMenu: false,
            title: "Term & Condition",
          ),
          20.h.verticalSpace,
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. \n\nNisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. \n\nLorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. \n\nTristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. \n\nLorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. \n\nNisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. \n\nLorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. \n\nTristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.',
                      style:
                          TextStyle(fontSize: 16, color: ColorUtils.textColor),
                    )
                  ],
                ),
                30.verticalSpace
              ],
            ),
          ),
        ],
      )),
    );
  }
}
