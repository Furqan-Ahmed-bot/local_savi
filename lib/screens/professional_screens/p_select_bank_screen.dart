// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/resources/components/round_button.dart';
import 'package:local_saviors/screens/professional_screens/p_add_banks_screen.dart';
import 'package:local_saviors/utils/color_utils.dart';
import 'package:local_saviors/utils/images/image_assets.dart';
import '../../controllers/professional_controllers/add_bank_controller.dart';
import '../../resources/components/widgets.dart';
import 'p_addfunds_screen.dart';

class SelectBankScreen extends GetWidget<AddBankController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RoundButton(
        title: 'Confirm',
        onPress: () {
          Get.to(() => AddFundsScreen());
        },
        width: 0.9.sw,
        buttonColor: ColorUtils.red,
      ),
      body: myBackGround(
          child: Column(
        children: [
          appbar(
            isMenu: false,
            title: "My Wallet",
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 0.055.sw,
                vertical: 30.h,
              ),
              children: [
                ...List.generate(
                    controller.banks.length,
                    (i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BankSelectionTile(
                          bankName: controller.banks[i]['name'],
                          imagePath: controller.banks[i]['image'],
                          isSelected: controller.banks[i]['isSelected'],
                          onChanged: (value) {},
                          routingNumber: controller.banks[i]['routing no'],
                        ))),
                4.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.add),
                    7.w.horizontalSpace,
                    InkWell(
                      onTap: () {
                        Get.to(() => AddBanksScreen());
                      },
                      child: Text('Add Card',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              color: ColorUtils.red,
                              fontSize: 12)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class BankSelectionTile extends StatelessWidget {
  final String bankName;
  final String routingNumber;
  final String imagePath;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  BankSelectionTile({
    required this.bankName,
    required this.routingNumber,
    required this.imagePath,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isSelected),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
                  imagePath,
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
                      bankName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      routingNumber,
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
            Radio<bool>(
              value: true,
              groupValue: isSelected,
              onChanged: (bool? value) {
                onChanged(value ?? false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
