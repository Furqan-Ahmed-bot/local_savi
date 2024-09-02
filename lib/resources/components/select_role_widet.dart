// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/images/image_assets.dart';

class SelectRoleWidget extends StatelessWidget {
  final title;
  final icon;
  void Function()? onTap;
  SelectRoleWidget({super.key, this.title, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 0.9.sw,
        height: 0.14.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFD6EFFF),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              icon,
              scale: 4,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Image.asset(
              ImageAssets.arrow,
              scale: 4,
            ),
          ],
        ),
      ),
    );
  }
}
