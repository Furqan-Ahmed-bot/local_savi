// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/wallet_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import '../../utils/routes/routes.dart';

class WalletScreen extends GetWidget<WalletController> {
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
          SizedBox(
            height: 60.h,
            width: 60.w,
            child: Image.asset(
              ImageAssets.applyJobs,
              fit: BoxFit.cover,
            ),
          ),
          11.w.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transfer',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              9.h.verticalSpace,
              Text(
                'Aug 25, 2022 | 10:00 AM',
                style: TextStyle(),
              ),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' \$32.00',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              )),
          9.h.verticalSpace,
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
