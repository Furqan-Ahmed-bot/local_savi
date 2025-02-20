import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/user_controllers/dispute_payment_screen_controller.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/api_services/user_services.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/constant.dart';

class DisputePaymentScreen extends GetWidget<DisputePaymentScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisputePaymentScreenController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
          child: controller.isLoading.value
              ? const SizedBox()
              : RoundButton(
                  buttonColor: ColorUtils.red,
                  title: "Submit",
                  onPress: () {
                    // if (controller.reasonCotnroller.text.isNotEmpty) {
                    UserServices.instance.createDispute(
                        context: context,
                        dispute: controller.ListOfReasons
                            .value[controller.groupValue.value]['id'],
                        id: controller.jobId.value);
                    // } else {
                    //   Get.snackbar("Alert", "Write your reason",
                    //       backgroundColor: ColorUtils.white);
                    // }
                  }),
        ),
        body: Obx(
          () => myBackGround(
              child: controller.isLoading.value
                  ? Center(
                      child: spinkit,
                    )
                  : SingleChildScrollView(
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appbar(
                              isMenu: false,
                              title: "Dispute Payment",
                            ),
                            20.h.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Reason",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Obx(
                                    () => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(5, (index) {
                                        return ListTile(
                                          horizontalTitleGap: 0,
                                          title: Text(
                                            controller.ListOfReasons[index]
                                                ['reason_text'],
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                          leading: Radio<int>(
                                            value: index,
                                            activeColor: ColorUtils.blue,
                                            groupValue:
                                                controller.groupValue.value,
                                            onChanged: (int? value) {
                                              controller.groupValue.value =
                                                  value!;
                                            },
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  20.h.verticalSpace,
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: ColorUtils.white,
                                      border: Border.all(
                                          width: 1.0.w,
                                          color: ColorUtils.borderColor),
                                    ),
                                    child: TextField(
                                      maxLines: 5,
                                      controller: controller.reasonCotnroller,
                                      onTapOutside: (event) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: "Write a reaason",
                                        hintStyle:
                                            TextStyle(color: ColorUtils.grey),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 0.051.sw,
                                            vertical: 0.016.sh),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
        ),
      );
    });
  }
}

Widget myRadioButton(
    {required String title,
    required int value,
    required Function onChanged,
    required groupValue}) {
  return RadioListTile(
    value: value,
    groupValue: groupValue,
    onChanged: onChanged(),
    title: Text(title),
  );
}
