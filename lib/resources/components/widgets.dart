// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_saviors/controllers/professional_controllers/p_home_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import 'package:local_saviors/utils/routes/routes.dart';

Widget getSenderView(
        {CustomClipper? clipper, BuildContext? context, String? text}) =>
    Column(
      children: [
        ChatBubble(
          clipper: clipper,
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 20.h),
          backGroundColor: ColorUtils.chatBgColor,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            width: 0.6.sw,
            child: Text(
              text.toString(),
              style: TextStyle(
                  color: ColorUtils.textColor,
                  // fontFamily: Font.interRegular,
                  fontSize: 12.sp),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        5.verticalSpace,
        SizedBox(
            width: 0.4.sw,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Spacer(),
                Text(
                  "03:35 pm",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            )),
        20.verticalSpace,
      ],
    );

Widget getReceiverView(
        {CustomClipper? clipper, BuildContext? context, String? text}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          ImageAssets.oliverImg,
          scale: 2,
        ),
        10.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Oliver Mark",
              softWrap: true,
              style: TextStyle(
                  height: 0.5, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            ChatBubble(
              clipper: clipper,
              backGroundColor: ColorUtils.white,
              margin: EdgeInsets.only(top: 20.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                width: 0.6.sw,
                child: Text(
                  text.toString(),
                  style: TextStyle(
                      color: ColorUtils.textColor,
                      // fontFamily: Font.interRegular,
                      fontSize: 12.sp),
                ),
              ),
            ),
            5.verticalSpace,
            SizedBox(
              width: 0.65.sw,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Text(
                    "03:35 pm",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );

Widget ratingReviewCard({
  required String image,
  required String name,
  required String dateTime,
  required String desc,
  bool isReply = false,
}) {
  return Container(
    padding: EdgeInsets.all(15.sp),
    margin: EdgeInsets.only(bottom: 12.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
          width: 1.w, color: ColorUtils.borderColor.withOpacity(0.5)),
      color: ColorUtils.white,
    ),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              image,
              scale: 2,
            ),
            11.w.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                // 6.h.verticalSpace,
                Text(
                  dateTime,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: ColorUtils.txtGrey),
                ),
              ],
            ),
          ],
        ),
        11.h.verticalSpace,
        Text(
          desc,
          style: TextStyle(fontSize: 14.sp, color: ColorUtils.txtGreyDark),
        ),
        25.h.verticalSpace,
        isReply
            ? Divider(
                color: ColorUtils.borderColor.withOpacity(0.5),
              )
            : const SizedBox.shrink(),
        isReply
            ? Padding(
                padding: EdgeInsets.only(left: 30.w, top: 14.h),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageAssets.oliverImg,
                              scale: 2,
                            ),
                            11.w.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Oliver Mark",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                // 6.h.verticalSpace,
                                Text(
                                  "Today | 02:35 pm",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: ColorUtils.txtGrey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        11.h.verticalSpace,
                        Text(
                          "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti.",
                          style: TextStyle(
                              fontSize: 14.sp, color: ColorUtils.txtGreyDark),
                        )
                      ],
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink()
      ],
    ),
  );
}

Widget userRequestCard({
  required bool isVerified,
  required String id,
  required String image,
  required String name,
  required String rating,
}) {
  return Column(
    children: [
      Divider(
        color: ColorUtils.borderColor.withOpacity(0.5),
      ),
      20.h.verticalSpace,
      Container(
        width: 1.0.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.bestPerformerDetailScreenPath,
                    arguments: {
                      "id": id,
                      "title": "User Request",
                      "showChat": true,
                    });
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(1000.r),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000.r),
                              border: Border.all(
                                  width: 1.w,
                                  color:
                                      ColorUtils.borderColor.withOpacity(0.5))),
                          child: Image.network(
                            image,
                            height: 50,
                            width: 50,
                          ),
                          // child: Image.asset(
                          //   image,
                          //   scale: 2,
                          // ),
                        ),
                      ),
                      isVerified
                          ? Positioned(
                              right: 0,
                              child: Image.asset(
                                ImageAssets.verifiedIcon,
                                scale: 2,
                              ))
                          : const SizedBox(),
                    ],
                  ),
                  20.w.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.sp),
                      ),
                      5.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssets.starIcon,
                            scale: 2,
                          ),
                          7.w.horizontalSpace,
                          Text(
                            rating,
                            style: const TextStyle(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    await UserServices.instance.acceptRejectJobRequest(
                        id: id, status: "REJECTED", context: Get.context);
                  },
                  child: Container(
                    // width: 120.w,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10.w),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                    decoration: BoxDecoration(
                        color: ColorUtils.white,
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(
                            width: 1.w,
                            color: ColorUtils.borderColor.withOpacity(0.5))),
                    child: Text(
                      "Reject",
                      style:
                          TextStyle(fontSize: 16.sp, color: ColorUtils.black),
                    ),
                  ),
                ),
                10.w.horizontalSpace,
                InkWell(
                  onTap: () async {
                    await UserServices.instance.acceptRejectJobRequest(
                        id: id, status: "ACCEPTED", context: Get.context);
                  },
                  child: Container(
                    // width: 120.w,
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(right: 10.w),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),

                    decoration: BoxDecoration(
                        color: ColorUtils.red,
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(
                            width: 1.w,
                            color: ColorUtils.red.withOpacity(0.5))),
                    child: Text(
                      "Accept",
                      style:
                          TextStyle(fontSize: 16.sp, color: ColorUtils.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ],
  );
}

Widget inviteUserCard({
  required bool isVerified,
  required String image,
  required String name,
  required String rating,
  required bool isInvited,
}) {
  return Column(
    children: [
      Divider(
        color: ColorUtils.borderColor.withOpacity(0.5),
      ),
      20.h.verticalSpace,
      Container(
        width: 1.0.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000.r),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000.r),
                            border: Border.all(
                                width: 1.w,
                                color:
                                    ColorUtils.borderColor.withOpacity(0.5))),
                        child: Image.network(
                          image,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    isVerified
                        ? Positioned(
                            right: 0,
                            child: Image.asset(
                              ImageAssets.verifiedIcon,
                              scale: 2,
                            ))
                        : const SizedBox(),
                  ],
                ),
                20.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.sp),
                    ),
                    5.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAssets.starIcon,
                          scale: 2,
                        ),
                        7.w.horizontalSpace,
                        Text(
                          rating,
                          style: const TextStyle(),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Container(
              // width: 120.w,
              alignment: Alignment.center,
              // margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),

              decoration: BoxDecoration(
                  color: ColorUtils.red,
                  borderRadius: BorderRadius.circular(10.sp),
                  border: Border.all(
                      width: 1.w, color: ColorUtils.red.withOpacity(0.5))),
              child: Row(
                children: [
                  isInvited
                      ? Image.asset(
                          ImageAssets.doneMark,
                          scale: 2,
                        )
                      : Image.asset(
                          ImageAssets.applyJobs,
                          color: ColorUtils.white,
                          scale: 2,
                        ),
                  5.w.horizontalSpace,
                  Text(
                    isInvited ? "Sent" : "Invite",
                    style: TextStyle(fontSize: 16.sp, color: ColorUtils.white),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget messageUserCard({
  required bool isVerified,
  required String image,
  required String name,
  required String date,
  required String desc,
}) {
  return Container(
    padding: EdgeInsets.all(15.sp),
    margin: EdgeInsets.only(bottom: 16.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1.w,
          color: ColorUtils.borderColor,
        ),
        color: ColorUtils.white),
    width: 1.0.sw,
    child: Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(
                        width: 1.w,
                        color: ColorUtils.borderColor.withOpacity(0.5))),
                child: Image.asset(
                  image,
                  scale: 2,
                ),
              ),
            ),
            isVerified
                ? Positioned(
                    right: 0,
                    child: Image.asset(
                      ImageAssets.verifiedIcon,
                      scale: 2,
                    ))
                : const SizedBox(),
          ],
        ),
        20.w.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 0.5.sw,
                  child: Text(
                    name,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: ColorUtils.borderColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                ),
              ],
            ),
            5.h.verticalSpace,
            Container(
              width: 0.65.sw,
              child: Text(
                desc,
                style: TextStyle(fontSize: 16.sp),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget bestPerformerCard({
  required String id,
  required bool isVerified,
  required String image,
  required String name,
  required String rating,
}) {
  return Column(
    children: [
      Divider(
        color: ColorUtils.borderColor.withOpacity(0.5),
      ),
      20.h.verticalSpace,
      Container(
        width: 1.0.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.bestPerformerDetailScreenPath,
                    arguments: {
                      "id": id,
                      "title": "Best Performer",
                      "showChat": true,
                    });
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipOval(
                          child: Image.network(
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            fit: BoxFit.cover,
                            '${image}',
                            scale: 2,
                          ),
                        ),
                      ),
                      isVerified
                          ? Positioned(
                              right: 0,
                              child: Image.asset(
                                ImageAssets.verifiedIcon,
                                scale: 2,
                              ))
                          : const SizedBox(),
                    ],
                  ),
                  20.w.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.sp),
                      ),
                      5.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssets.starIcon,
                            scale: 2,
                          ),
                          7.w.horizontalSpace,
                          Text(
                            rating,
                            style: const TextStyle(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RouteName.chatScreenPath);
              },
              child: Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorUtils.yellowLightBG),
                child: Image.asset(
                  ImageAssets.msgIcon,
                  scale: 2,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget shortlistUserCard({
  required bool isVerified,
  String? id,
  bool showMessageButton = true,
  bool isJobCompleted = false,
  required String image,
  required String name,
  required String rating,
  required context,
  bool showSelectJobButton = true,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(15.sp),
        margin: EdgeInsets.only(bottom: 16.h),
        width: 1.0.sw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 1.w,
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            color: ColorUtils.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.bestPerformerDetailScreenPath,
                    arguments: showSelectJobButton
                        ? {
                            'id': id,
                            "title": "Shortlist User",
                            "showChat": true,
                          }
                        : {
                            'id': id,
                            "title": "Employee Profile",
                            "showChat": true,
                          });
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipOval(
                          child: Image.network(
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            fit: BoxFit.cover,
                            image,
                            scale: 2,
                          ),
                        ),
                      ),
                      isVerified
                          ? Positioned(
                              right: 0,
                              child: Image.asset(
                                ImageAssets.verifiedIcon,
                                scale: 2,
                              ))
                          : const SizedBox(),
                    ],
                  ),
                  20.w.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.sp),
                      ),
                      5.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssets.starIcon,
                            scale: 2,
                          ),
                          7.w.horizontalSpace,
                          Text(
                            rating,
                            style: const TextStyle(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                showSelectJobButton
                    ? GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  insetPadding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  backgroundColor: ColorUtils.dialogeBGColor,
                                  content: SizedBox(
                                    width: 1.0.sw,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        20.h.verticalSpace,
                                        Image.asset(
                                          ImageAssets.jobBigIcon,
                                          scale: 2,
                                        ),
                                        20.h.verticalSpace,
                                        Text(
                                          "Select For Job!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorUtils.black,
                                            fontSize: 22.sp,
                                          ),
                                        ),
                                        24.h.verticalSpace,
                                        Text(
                                          "Are you sure you want select ${name} for your job?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorUtils.black,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Container(
                                      width: 1.0.sw,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () async {
                                                await UserServices.instance
                                                    .acceptRejectJobRequest(
                                                        context: context,
                                                        id: id!,
                                                        status: "ACCEPTED");
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h),
                                                decoration: BoxDecoration(
                                                    color: ColorUtils.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    border: Border.all(
                                                        width: 1.w,
                                                        color: ColorUtils
                                                            .borderColor)),
                                                child:
                                                    const Text("Yes, Select"),
                                              ),
                                            ),
                                          ),
                                          20.w.horizontalSpace,
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  color: ColorUtils.red,
                                                ),
                                                child: Text(
                                                  "No",
                                                  style: TextStyle(
                                                      color: ColorUtils.white),
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
                        },
                        child: Container(
                          // width: 120.w,
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(right: 10.w),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 15.w),

                          decoration: BoxDecoration(
                              color: ColorUtils.red,
                              borderRadius: BorderRadius.circular(10.sp),
                              border: Border.all(
                                  width: 1.w,
                                  color: ColorUtils.red.withOpacity(0.5))),
                          child: Text(
                            "Select for job",
                            style: TextStyle(
                                fontSize: 14.sp, color: ColorUtils.white),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                showSelectJobButton
                    ? 12.w.horizontalSpace
                    : 0.w.horizontalSpace,
                showMessageButton
                    ? InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.chatScreenPath);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtils.yellowLightBG),
                          child: Image.asset(
                            ImageAssets.msgIcon,
                            scale: 2,
                          ),
                        ),
                      )
                    : isJobCompleted
                        ? Row(
                            children: [
                              Image.asset(
                                ImageAssets.greenVerifiedIcon,
                                scale: 2,
                              ),
                              10.w.horizontalSpace,
                              Text(
                                "Job Completed",
                                style: TextStyle(fontSize: 16.sp),
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

Widget pJobDetailUserCard({
  required bool isVerified,
  required String image,
  required String name,
  required String city,
  required String postedDate,
  required context,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(15.sp),
        margin: EdgeInsets.only(bottom: 16.h),
        width: 1.0.sw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 1.w,
              color: ColorUtils.borderColor.withOpacity(0.5),
            ),
            color: ColorUtils.white),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.pJobProviderScreenPath);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipOval(
                          child: Image.network(
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            fit: BoxFit.cover,
                            '${image}',
                            scale: 2,
                          ),
                        ),
                      ),
                      isVerified
                          ? Positioned(
                              right: 0,
                              child: Image.asset(
                                ImageAssets.verifiedIcon,
                                scale: 2,
                              ))
                          : const SizedBox(),
                    ],
                  ),
                  20.w.horizontalSpace,
                  Container(
                    width: 0.65.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16.sp),
                            ),
                            5.h.verticalSpace,
                            Text(
                              city,
                              style: const TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Job Posted",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16.sp),
                            ),
                            5.h.verticalSpace,
                            Text(
                              postedDate,
                              style: const TextStyle(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget activeJobCard({
  String status = "",
  String? title,
  String? desc,
  String? time,
  String? date,
  String? budget,
  String? workerType,
}) {
  return Container(
    width: 1.0.sw,
    margin: EdgeInsets.only(bottom: 16.h),
    padding: EdgeInsets.all(10.sp),
    decoration: BoxDecoration(
      color: ColorUtils.white,
      border: Border.all(width: 1.w, color: ColorUtils.borderColor),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 0.43.sw,
              child: Text(
                title ?? "Lorem ipsum dolor sit...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Text(
              workerType != null
                  ? "For ${workerType} | ${date != null ? DateFormat("d MMMM").format(DateTime.parse(date)) : ""}"
                  : "For ${workerType} | ${date != null ? DateFormat("d MMMM").format(DateTime.parse(date)) : ""}",
              style: TextStyle(fontSize: 12.sp, color: ColorUtils.borderColor),
            )
          ],
        ),
        6.h.verticalSpace,
        Text(
          desc ??
              'Lorem ipsum dolor sit amet consectetur adipiscing elit odio.',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          maxLines: 3,
        ),
        6.h.verticalSpace,
        Divider(
          color: ColorUtils.borderColor.withOpacity(0.5),
        ),
        6.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Budget",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  budget != null ? "\$$budget" : "",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              width: 1.w,
              decoration: BoxDecoration(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Time",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  time != null
                      ? DateFormat("HH:mm").format(DateTime.parse(time))
                      : "",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              width: 1.w,
              decoration: BoxDecoration(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Date",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  " ${date != null ? DateFormat("MMM d, yyyy").format(DateTime.parse(date)) : ""}",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (status != "")
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
              6.h.verticalSpace,
              Row(
                children: [
                  Text(
                    "Status: ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: status == "Completed"
                            ? ColorUtils.green
                            : ColorUtils.blue),
                  ),
                ],
              )
            ],
          )
      ],
    ),
  );
}

Widget myBackGround({
  required Widget child,
  Widget? bottomNavBar,
}) {
  return Scaffold(
    extendBody: true,
    bottomNavigationBar: Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 25.h, left: 16.w, right: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [bottomNavBar ?? const SizedBox()],
      ),
    ),
    body: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorUtils.primary, // Light blue shade for the top
            ColorUtils.white, // White shade for the bottom
          ],
        ),
      ),
      child: child,
    ),
  );
}

Widget appbar({
  required bool isMenu,
  required String title,
  List<Widget>? actions,
}) {
  return Container(
    margin: EdgeInsets.only(top: 60.h),
    width: 1.0.sw,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isMenu
            ? Container(
                margin: EdgeInsets.only(left: 20.w),
                padding: EdgeInsets.all(8.sp),
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
                child: Image.asset(
                  ImageAssets.menunicon,
                  scale: 2,
                ),
              )
            : GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20.w),
                  padding: EdgeInsets.all(8.sp),
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: ColorUtils.appbarButtonBG),
                  child: Image.asset(
                    ImageAssets.backArrow,
                    scale: 2,
                  ),
                ),
              ),
        title != ""
            ? Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              )
            : Image.asset(
                ImageAssets.logoSamll,
                scale: 2,
              ),
        Row(
          children: actions ??
              [
                Container(
                  width: 80.w,
                )
              ],
        )
      ],
    ),
  );
}

Widget applyJobCard({
  required context,
  String? id = "",
  String? status = "",
  String? title,
  String? desc,
  String? date,
  String? budget,
  String? time,
}) {
  return Container(
    width: 1.0.sw,
    margin: EdgeInsets.only(bottom: 16.h),
    padding: EdgeInsets.all(10.sp),
    decoration: BoxDecoration(
      color: ColorUtils.white,
      border: Border.all(width: 1.w, color: ColorUtils.borderColor),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 0.43.sw,
              child: Text(
                title ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Text(
              date != null
                  ? DateFormat("d MMMM").format(DateTime.parse(date))
                  : "",
              style: TextStyle(fontSize: 12.sp, color: ColorUtils.borderColor),
            )
          ],
        ),
        6.h.verticalSpace,
        Text(
          desc ?? '',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          maxLines: 3,
        ),
        12.h.verticalSpace,
        Divider(
          color: ColorUtils.borderColor.withOpacity(0.5),
        ),
        // 12.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Budget",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  "\$$budget",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              width: 1.w,
              decoration: BoxDecoration(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Time",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  time != null
                      ? DateFormat("HH:mm").format(DateTime.parse(time))
                      : "",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              width: 1.w,
              decoration: BoxDecoration(
                color: ColorUtils.borderColor.withOpacity(0.5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Job Date",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.blue,
                    fontSize: 12.sp,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  " ${date != null ? DateFormat("MMM d, yyyy").format(DateTime.parse(date)) : ""}",
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: ColorUtils.borderColor.withOpacity(0.5),
        ),
        // 10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                UserServices.instance
                    .saveUnsaveBookmarkService(jobId: id!, context: context);
              },
              child: Image.asset(
                ImageAssets.saveIcon,
                scale: 2,
              ),
            ),
            RoundButton(
              title: "Apply Job",
              onPress: () {
                UserServices.instance
                    .applyPerformerJob(context: context, jobId: id);
              },
              // horizonalPad: 20.w,
              width: 150.w,
              buttonColor: ColorUtils.red,
            )
          ],
        )
      ],
    ),
  );
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
