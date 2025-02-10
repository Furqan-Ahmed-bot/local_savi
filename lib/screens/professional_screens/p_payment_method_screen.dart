// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_saviors/controllers/professional_controllers/payment_method_controller.dart';
import 'package:local_saviors/resources/components/widgets.dart';
import 'package:local_saviors/utils/constant.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

import 'p_addaccount_screen.dart';
import 'p_addfunds_screen.dart';
import 'p_select_bank_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final controller = Get.put(PaymentMethodController());

  @override
  void initState() {
    Future.microtask(() {
      controller.getAllBanks();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBackGround(
          child: Column(
        children: [
          appbar(
            isMenu: false,
            title: "Bank Details",
          ),
          30.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  children: [
                    // 20.verticalSpace,
                    controller.isLoading.value
                        ? Center(
                            child: spinkit,
                          )
                        : SizedBox(
                            width: 0.9.sw,
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.allBanks.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Dismissible(
                                      key: ValueKey(controller.allBanks[index]),
                                      confirmDismiss: (DismissDirection direction) async {
                                        if (controller.allBanks.length > 1) {
                                          bool? confirmDeletion = await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text("Confirm Delete"),
                                                content: const Text("Are you sure you want to delete this bank?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(true); // Confirm deletion
                                                    },
                                                    child: const Text("Yes"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(false); // Cancel deletion
                                                    },
                                                    child: const Text("No"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          if (confirmDeletion == true) {
                                            // walletVM.deleteBanks(walletVM.allBanks[index]['id']);
                                            return true; // Allow the dismiss
                                          } else {
                                            return false; // Cancel the dismiss
                                          }
                                        } else {
                                          Get.snackbar('Alert', 'You cannot delete the default external account for your default currency');

                                          return false; // Prevent dismiss if it’s the only account
                                        }
                                      },
                                      onDismissed: (DismissDirection direction) {
                                        controller.allBanks.removeAt(index); // Remove item if dismissed
                                      },
                                      child: BankSelectionTile(
                                        bankName: controller.allBanks[index]['bank_name'],
                                        imagePath: ImageAssets.bank1,
                                        isSelected: controller.selectedBankIndex.value == index,
                                        onChanged: (value) {
                                          // Update selected bank
                                          controller.selectedBank(index, controller.allBanks[index]);
                                        },
                                        routingNumber: controller.allBanks[index]['routing_number'],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                    20.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/addicon.png',
                            scale: 3,
                          ),
                          7.w.horizontalSpace,
                          InkWell(
                            onTap: () {
                              Get.to(() => AddNewBankScreen());
                            },
                            child: Text(
                              'Add Bank',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: DottedBorder(
            radius: Radius.circular(10.r),
            borderType: BorderType.RRect,
            strokeCap: StrokeCap.round,
            dashPattern: const [5, 5],
            strokeWidth: 1.5,
            color: Color(0xff2B4C96),
            child: InkWell(
              onTap: () {
                if (controller.selectedBankIndex.value == -1) {
                  Get.snackbar('Alert', 'Please Select Bank');
                } else {
                  Get.to(() => AddFundsScreen());

                  //Get.to(() => WithdrawAmountScreen());
                }
              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 16),
                  ))),
            )),
      ),
    );
  }
}

// class PaymentMethodScreen extends GetWidget<PaymentMethodController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: myBackGround(
//           child: Column(
//         children: [
//           appbar(
//             isMenu: false,
//             title: "Bank Details",
//           ),
//           30.verticalSpace,
//           SizedBox(
//             width: double.infinity,
//             child: Obx(
//               () => SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // 20.verticalSpace,
//                     controller.isLoading.value
//                         ? Center(
//                             child: spinkit,
//                           )
//                         : SizedBox(
//                             width: 0.9.sw,
//                             child: ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: controller.allBanks.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Dismissible(
//                                       key: ValueKey(controller.allBanks[index]),
//                                       confirmDismiss: (DismissDirection direction) async {
//                                         if (controller.allBanks.length > 1) {
//                                           bool? confirmDeletion = await showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return AlertDialog(
//                                                 title: const Text("Confirm Delete"),
//                                                 content: const Text("Are you sure you want to delete this bank?"),
//                                                 actions: [
//                                                   TextButton(
//                                                     onPressed: () {
//                                                       Navigator.of(context).pop(true); // Confirm deletion
//                                                     },
//                                                     child: const Text("Yes"),
//                                                   ),
//                                                   TextButton(
//                                                     onPressed: () {
//                                                       Navigator.of(context).pop(false); // Cancel deletion
//                                                     },
//                                                     child: const Text("No"),
//                                                   ),
//                                                 ],
//                                               );
//                                             },
//                                           );

//                                           if (confirmDeletion == true) {
//                                             // walletVM.deleteBanks(walletVM.allBanks[index]['id']);
//                                             return true; // Allow the dismiss
//                                           } else {
//                                             return false; // Cancel the dismiss
//                                           }
//                                         } else {
//                                           Get.snackbar('Alert', 'You cannot delete the default external account for your default currency');

//                                           return false; // Prevent dismiss if it’s the only account
//                                         }
//                                       },
//                                       onDismissed: (DismissDirection direction) {
//                                         controller.allBanks.removeAt(index); // Remove item if dismissed
//                                       },
//                                       child: BankSelectionTile(
//                                         bankName: controller.allBanks[index]['bank_name'],
//                                         imagePath: ImageAssets.bank1,
//                                         isSelected: controller.selectedBankIndex.value == index,
//                                         onChanged: (value) {
//                                           // Update selected bank
//                                           controller.selectedBank(index, controller.allBanks[index]);
//                                         },
//                                         routingNumber: controller.allBanks[index]['routing_number'],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                     20.verticalSpace,
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/icons/addicon.png',
//                             scale: 3,
//                           ),
//                           7.w.horizontalSpace,
//                           InkWell(
//                             onTap: () {
//                               Get.to(() => AddNewBankScreen());
//                             },
//                             child: Text(
//                               'Add Bank',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 decoration: TextDecoration.underline,
//                                 color: Colors.black,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//         child: DottedBorder(
//             radius: Radius.circular(10.r),
//             borderType: BorderType.RRect,
//             strokeCap: StrokeCap.round,
//             dashPattern: const [5, 5],
//             strokeWidth: 1.5,
//             color: Color(0xff2B4C96),
//             child: InkWell(
//               onTap: () {
//                 if (controller.selectedBankIndex.value == -1) {
//                   Get.snackbar('Alert', 'Please Select Bank');
//                 } else {
//                   Get.to(() => AddFundsScreen());

//                   //Get.to(() => WithdrawAmountScreen());
//                 }
//               },
//               child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
//                   child: Center(
//                       child: Text(
//                     'Confirm',
//                     style: TextStyle(fontSize: 16),
//                   ))),
//             )),
//       ),
//     );
//   }
// }
