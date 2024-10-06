// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:local_saviors/utils/images/image_assets.dart';

class BackButtonWidget extends StatelessWidget {
  void Function()? onTap;
  BackButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white.withOpacity(0.7),
            ),
            child: Image.asset(
              ImageAssets.backArrow,
              scale: 1.5,
            )),
      ),
    );
  }
}
