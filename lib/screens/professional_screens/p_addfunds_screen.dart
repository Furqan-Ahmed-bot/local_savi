// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../controllers/professional_controllers/add_funds_controller.dart';
import '../../controllers/professional_controllers/payment_method_controller.dart';
import '../../resources/components/text_fields.dart';

class AddFundsScreen extends GetWidget<AddFundsController> {
  final paymentController = Get.put(PaymentMethodController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
          child: Column(
        children: [
          appbar(
            isMenu: false,
            title: "My Wallet",
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.055.sw,
              vertical: 30.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 25.h,
                    horizontal: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox.square(
                            dimension: 65.h,
                            child: Image.asset(
                              ImageAssets.wallet,
                            ),
                          ),
                          25.w.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Balance',
                                style: TextStyle(color: ColorUtils.blue, fontSize: 12),
                                // style:  context.,
                              ),
                              7.h.verticalSpace,
                              Text(
                                '\$ ${paymentController.totalAmount.value}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                                // style:  context.,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            7.r,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.35),
                              offset: const Offset(0, 18),
                              blurRadius: 20,
                              spreadRadius: -12,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                30.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Bank logo
                          Image.asset(
                            ImageAssets.bank3,
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 16),

                          // Bank name and routing number
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${paymentController.bankName}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '${paymentController.routingNumber}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Radio button
                    ],
                  ),
                ),
                30.verticalSpace,
                Divider(),
                10.verticalSpace,
                Text(
                  'Enter the amount of transfer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                10.verticalSpace,
                AuthTextField(
                  controller: paymentController.amountController,
                  type: TextInputType.number,
                  hint: '',
                  icon: ImageAssets.dollar,
                  hintColor: Color(0xffA5A5A5),
                ),
                30.verticalSpace,
                RoundButton(
                  title: 'Confirm',
                  onPress: () {
                    if (paymentController.amountController.text.isEmpty) {
                      Get.snackbar('Alert', 'Please Enter Amount');
                    } else {
                      paymentController.transferAmount(context);
                    }
                  },
                  width: 0.9.sw,
                  buttonColor: ColorUtils.red,
                  height: 50,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
