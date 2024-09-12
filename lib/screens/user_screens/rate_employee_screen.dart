import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/rate_employee_screen_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class RateEmployeeScreen extends GetWidget<RateEmployeeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: RoundButton(
            buttonColor: ColorUtils.red,
            title: "Submit",
            onPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: ColorUtils.dialogeBGColor,
                      content: SizedBox(
                        width: 1.0.sw,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            20.h.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  ImageAssets.cutIcon,
                                  scale: 2,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(23.sp),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtils.jobIconBG),
                              child: Image.asset(
                                ImageAssets.shareIcon,
                                scale: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Container(
                          width: 1.0.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: ColorUtils.red,
                                    ),
                                    child: Text(
                                      "Share Your Experience",
                                      style: TextStyle(color: ColorUtils.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }),
      ),
      body: myBackGround(
          child: Column(
        children: [
          appbar(
            isMenu: false,
            title: "Rate Employee",
          ),
          Expanded(
              child: ListView(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, bottom: 30.h, top: 20.h),
                  children: [
                20.h.verticalSpace,
                shortlistUserCard(
                    context: context,
                    name: "Oliver Mark",
                    rating: "(4.5)",
                    isVerified: true,
                    isJobCompleted: true,
                    showMessageButton: false,
                    showSelectJobButton: false,
                    image: ImageAssets.oliverImg),
                // 20.h.verticalSpace,
                Container(
                  padding: EdgeInsets.only(top: 24.h, bottom: 34.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: ColorUtils.white,
                    border:
                        Border.all(width: 1.0.w, color: ColorUtils.borderColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Give a Rate",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      20.h.verticalSpace,
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30.sp,
                        glow: false,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Image.asset(
                          ImageAssets.starIcon,
                          scale: 2,
                        ),
                        onRatingUpdate: (rating) {
                          controller.ratingValue.value = rating;
                        },
                      ),
                    ],
                  ),
                ),
                20.h.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorUtils.white,
                    border:
                        Border.all(width: 1.0.w, color: ColorUtils.borderColor),
                  ),
                  child: TextField(
                    maxLines: 4,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Write a review",
                      hintStyle: TextStyle(color: ColorUtils.grey),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 0.051.sw, vertical: 0.016.sh),
                    ),
                  ),
                )
              ])),
        ],
      )),
    );
  }
}


  // showDialog(
  //                 context: context,
  //                 builder: (BuildContext context) {
  //                   return AlertDialog(
  //                     insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
  //                     clipBehavior: Clip.antiAliasWithSaveLayer,
  //                     backgroundColor: ColorUtils.dialogeBGColor,
  //                     content: SizedBox(
  //                       width: 1.0.sw,
  //                       child: Column(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           20.h.verticalSpace,
  //                           Container(
  //                             padding: EdgeInsets.all(23.sp),
  //                             decoration: BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                                 color: ColorUtils.jobIconBG),
  //                             child: Image.asset(
  //                               ImageAssets.jobDoneIcon,
  //                               scale: 2,
  //                             ),
  //                           ),
  //                           20.h.verticalSpace,
  //                           Text(
  //                             "Job Done!",
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(
  //                               color: ColorUtils.black,
  //                               fontSize: 22.sp,
  //                             ),
  //                           ),
  //                           24.h.verticalSpace,
  //                           Text(
  //                             "Payment transfer successfully!",
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(
  //                               color: ColorUtils.black,
  //                               fontSize: 14.sp,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     actions: [
  //                       Container(
  //                         width: 1.0.sw,
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Expanded(
  //                               child: GestureDetector(
  //                                 onTap: () {
  //                                   Get.close(2);
  //                                 },
  //                                 child: Container(
  //                                   alignment: Alignment.center,
  //                                   padding:
  //                                       EdgeInsets.symmetric(vertical: 15.h),
  //                                   decoration: BoxDecoration(
  //                                       color: ColorUtils.white,
  //                                       borderRadius:
  //                                           BorderRadius.circular(10.r),
  //                                       border: Border.all(
  //                                           width: 1.w,
  //                                           color: ColorUtils.borderColor)),
  //                                   child: const Text("Go back"),
  //                                 ),
  //                               ),
  //                             ),
  //                             20.w.horizontalSpace,
  //                             Expanded(
  //                               child: GestureDetector(
  //                                 onTap: () {
  //                                   Get.close(2);
  //                                   Get.offAndToNamed(
  //                                       RouteName.rateEmployeeScreenPath);
  //                                 },
  //                                 child: Container(
  //                                   alignment: Alignment.center,
  //                                   padding:
  //                                       EdgeInsets.symmetric(vertical: 15.h),
  //                                   decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(10.r),
  //                                     color: ColorUtils.red,
  //                                   ),
  //                                   child: Text(
  //                                     "Rate Employee",
  //                                     style: TextStyle(color: ColorUtils.white),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   );
  //                 });
            