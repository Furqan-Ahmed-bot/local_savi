// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      this.buttonColor = Colors.grey,
      this.textColor = Colors.white,
      this.bordercolor = Colors.grey,
      required this.title,
      required this.onPress,
      this.prefixIcon,
      this.borderwigth = 0.8,
      this.width = 60,
      this.iconpadding = 20,
      this.textcontainerwidth = 0.50,
      this.height = 50,
      this.loading = false,
      this.isBorderEnable = false,
      this.isFontBold = false})
      : super(key: key);

  final bool loading;
  final bool isBorderEnable;
  final bool isFontBold;
  final String title;
  final double height, width, iconpadding;
  final VoidCallback onPress;
  final Color textColor, buttonColor, bordercolor;
  final Widget? prefixIcon;
  final double borderwigth;
  final double textcontainerwidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
          border: isBorderEnable
              ? Border.all(
                  color: bordercolor,
                  width: borderwigth,
                )
              : Border(),
        ),
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    Container(child: prefixIcon),
                    iconpadding.horizontalSpace,
                  ],
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: prefixIcon != null ? textcontainerwidth.sw : null,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: isFontBold ? FontWeight.bold : null),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
