// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, unrelated_type_equality_checks, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/wallet_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../utils/routes/routes.dart';

class WalletScreen extends GetWidget<WalletController> {
  final ValueNotifier<int> ci = ValueNotifier(0);
  int currentIndex = 0;
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
              children: [
                buildWalletBalanceCard(
                  context,
                  balance: '\$15,658.2',
                  onTransfer: () {
                    Get.toNamed(RouteName.addBankScreen);
                  },
                ),
                10.verticalSpace,
                Divider(),

                ValueListenableBuilder(
                    valueListenable: ci,
                    builder: (_, v, c) {
                      return CustomTabBar.tabBar(
                        context,
                        options: [
                          'Credit',
                          'Debit',
                        ],
                        currentIndex: v,
                        onChanged: (i) {
                          currentIndex = i;
                          controller.updateIndex(currentIndex);

                          ci.value = i;
                          print(i);
                        },
                      );
                    }),

                10.verticalSpace,

                Divider(),

                Obx(
                  () => Container(
                    height: 0.52.sh,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      itemBuilder: (_, i) => transactionTile(context),
                      separatorBuilder: (_, i) => Divider(
                        height: 26.h,
                        thickness: 1.h,
                        color: const Color(0XFFBAC7DC),
                      ),
                      itemCount: controller.currentIndex == 0 ? 4 : 6,
                    ),
                  ),
                )
                // buildTransctions(context),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

Widget buildWalletBalanceCard(BuildContext context,
    {required String balance, VoidCallback? onTransfer}) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 25.h,
      horizontal: 20.w,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        7.r,
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
              dimension: 42.h,
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
                  balance,
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
          child: ElevatedButton(
            onPressed: onTransfer,
            style: ElevatedButton.styleFrom(
                minimumSize: Size(117.w, 50.h),
                maximumSize: Size(117.w, 50.h),
                backgroundColor: ColorUtils.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    7.r,
                  ),
                ),
                side: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                )),
            child: Text('Withdraw',
                style: TextStyle(color: Colors.white, fontSize: 11)),
          ),
        ),
      ],
    ),
  );
}

Widget buildTransctions(BuildContext context) {
  return Container(
    height: 100,
    // Ensure the Container has constraints to define its size
    constraints:
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
    child: ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 30.h),
      itemBuilder: (_, i) => transactionTile(context),
      separatorBuilder: (_, i) => Divider(
        height: 26.h,
        thickness: 1.h,
        color: const Color(0XFF03384C),
      ),
      itemCount: 6,
    ),
  );
}

Widget transactionTile(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 60.h,
          //   width: 60.w,
          //   child: Image.asset(
          //     ImageAssets.applyJobs,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // 11.w.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Job: Lorem ipsum dolor sit amet..',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              9.h.verticalSpace,
              Text(
                'Refund - Aug 25, 2022 | 10:00 AM',
                style: TextStyle(),
              ),
            ],
          ),
        ],
      ),
      Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(' \$32.00',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: ColorUtils.blue)),
          11.h.verticalSpace,
          Text(
            'Credit',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ],
  );
}

class CustomTabBar {
  static Widget tabBar(
    BuildContext context, {
    required List<String> options,
    required int currentIndex,
    required Function(int) onChanged,
  }) {
    return Row(
      children: List.generate(
        options.length,
        (i) => tab(context,
            label: options[i],
            onTap: () => onChanged(i),
            isSelected: currentIndex == i),
      ),
    );
  }

  static Widget tab(
    BuildContext context, {
    required String label,
    VoidCallback? onTap,
    required bool isSelected,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: AnimatedContainer(
            height: 40,
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              color: isSelected ? ColorUtils.red : Colors.white,
              borderRadius: BorderRadius.circular(
                10.r,
              ),
              border: Border.all(
                color: isSelected ? const Color(0X333A3A3C) : Colors.white,
              ),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: isSelected ? Colors.white : ColorUtils.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
