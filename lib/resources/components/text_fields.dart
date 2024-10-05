// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_saviors/main.dart';
import 'package:local_saviors/resources/extensions/context_extension.dart';
import 'package:local_saviors/utils/color_utils.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final String? label;
  final String? icon;
  final String? suffixIcon;
  final double? iconH;
  final String? initialValue;
  final double? iconW;
  final TextInputType? type;

  final FocusNode? focus;
  final FocusNode? nextFocus;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final VoidCallback? onTap;
  final double? radius;
  final double borderWidth;
  final double scale;
  final int? minLine;
  final int? maxLine;
  final Color? hintColor;
  final Color borderColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  AuthTextField({
    super.key,
    required this.hint,
    this.type,
    this.label,
    this.focus,
    this.nextFocus,
    this.validation,
    this.icon,
    this.borderColor = Colors.transparent,
    this.hintColor,
    this.iconH,
    this.iconW,
    this.borderWidth = 0,
    this.readOnly = false,
    this.controller,
    this.onTap,
    this.initialValue,
    this.suffixIcon,
    this.radius,
    this.scale = 1.6,
    this.minLine,
    this.maxLine,
    this.textStyle,
    this.padding,
  });

  // final FocusNode _focus = FocusNode();

  ValueNotifier<bool> isObsecure = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label ?? '',
            style: context.labelMedium,
          ),
          0.006.sh.verticalSpace,
        ],
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              border: Border.all(width: borderWidth, color: borderColor),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                  color: context.surface.withOpacity(
                    0.10,
                  ),
                )
              ]),
          child: ValueListenableBuilder(
              valueListenable: isObsecure,
              builder: (_, _isObsecure, c) {
                return TextFormField(
                  style: textStyle ?? context.titleMedium,
                  keyboardType: type,
                  controller: controller,
                  readOnly: readOnly,

                  onTap: onTap,
                  autofocus: false,
                  // initialValue: initialValue,
                  minLines: hint.toString().contains('Password') ? 1 : minLine,
                  maxLines: hint.toString().contains('Password') ? 1 : maxLine,
                  obscureText: _isObsecure,
                  // focusNode: _focus,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: hint,
                    hintStyle:
                        textStyle?.copyWith(color: context.onBackground) ??
                            context.bodySmall.copyWith(
                              color: hintColor ?? context.onBackground,
                            ),
                    prefixIcon: icon == null
                        ? null
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.02.sw,
                            ),
                            // padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              // height: iconH,
                              // width: iconW,
                              child: Image.asset(
                                icon ?? '',
                                scale: scale,
                              ),
                            ),
                          ),
                    suffixIcon: hint.toString().contains('Password')
                        ? (IconButton(
                            onPressed: () {
                              isObsecure.value = !isObsecure.value;
                            },
                            icon: Icon(
                              _isObsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: context.secondaryContainer,
                            ),
                          ))
                        : (suffixIcon != null
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    // horizontal: 0.051.sw,
                                    ),
                                // padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  suffixIcon ?? '',
                                  scale: 2.5,
                                ),
                              )
                            : null),
                    contentPadding: padding ??
                        EdgeInsets.symmetric(
                            horizontal: 0.051.sw, vertical: 0.016.sh),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 7.r),
                      borderSide: BorderSide(
                        color: context.onInverseSurface.withOpacity(0.10),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 7.r),
                      borderSide: BorderSide(
                        color: context.onInverseSurface.withOpacity(0.10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 7.r),
                      borderSide: BorderSide(
                        color: context.onInverseSurface.withOpacity(0.10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 7.r),
                      borderSide: BorderSide(
                        color: context.onInverseSurface.withOpacity(0.10),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 7.r),
                      borderSide: BorderSide(
                        color: context.onInverseSurface.withOpacity(0.10),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 7.r),
                      borderSide: BorderSide(
                        color: context.onInverseSurface.withOpacity(0.10),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class EditText extends StatelessWidget {
  Function(String?)? onChange, onSaved;
  String? Function(String?)? validator;
  final String? hintText,
      errorText,
      prefixIcon,
      suffixIcon,
      fontFamily,
      labelText;
  IconData? icon, prefixiconData;
  bool setEnable, showBorder;
  bool obscure;
  double? width;
  bool isDropDown, isPassword;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatter;
  FocusNode? currentFocus, nextFocus;
  BuildContext context;
  Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  VoidCallback? suffixClick;
  int? maxLines, maxLength, minLines;
  Color? filledcolor;
  Color bordercolor;
  Color? labelcolor;
  Color? hintColor;
  VoidCallback? ONTAP;
  bool? TExtAlign;
  bool? readonly;
  bool? needSuffix;
  Widget? suffixWidget;

  EditText({
    required this.context,
    this.onChange,
    this.hintText,
    this.errorText,
    this.icon,
    this.width,
    this.prefixiconData,
    this.prefixIcon,
    this.suffixIcon,
    this.fontFamily,
    this.onSaved,
    this.validator,
    this.setEnable = true,
    this.obscure = false,
    this.isDropDown = false,
    this.isPassword = false,
    this.needSuffix = false,
    this.suffixWidget,
    this.showBorder = true,
    this.currentFocus,
    this.nextFocus,
    this.textInputAction,
    this.textInputType,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.controller,
    this.suffixClick,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.filledcolor,
    this.labelText,
    this.hintColor,
    this.labelcolor,
    this.ONTAP,
    this.TExtAlign,
    this.readonly,
    this.textCapitalization,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      width: width ?? 1.0.sw,
      child: TextFormField(
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        cursorColor: ColorUtils.black,
        validator: validator,
        //      autovalidate: true,
        controller: controller,
        enabled: setEnable,
        onChanged: onChange,
        onSaved: onSaved,
        maxLines: maxLines,
        readOnly: readonly ?? false,
        maxLength: maxLength,
        textAlign: TExtAlign != null ? TextAlign.center : TextAlign.start,
        minLines: minLines,

        //      autofocus: true,
        focusNode: currentFocus,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        inputFormatters: inputFormatter,
        obscureText: obscure,
        //  cursorColor: accentColor,
        style: TextStyle(
          height: 1.2,
          fontSize: 14.sp,
          color: Colors.black,
          // fontFamily: Font.Medium,
        ),
        textAlignVertical: TextAlignVertical.center,
        onTap: ONTAP,
        onFieldSubmitted: onFieldSubmitted ??
            (value) {
              // print(navigationKey.currentContext!);
              _fieldFocusChange(currentFocus, nextFocus);
            },
        decoration: InputDecoration(
          errorMaxLines: 3,
          counterText: "",
          isCollapsed: prefixIcon != null ||
              prefixiconData != null ||
              suffixIcon != null,
          // contentPadding:
          //     // suffixIcon != null ? EdgeInsets.all(10) : EdgeInsets.all(15),
          //     suffixIcon != null
          //         ? EdgeInsets.only(
          //             left: 15,
          //             right: 3,
          //           )
          //         : EdgeInsets.all(15),
          contentPadding: EdgeInsets.only(
            // top: (currentFocus!.hasFocus || controller!.text!.isNotEmpty)
            //     ? 8
            //     : 0,
            right: 10,
            top: prefixIcon == null ? 20 : 18,
            bottom: prefixIcon == null ? 20 : 18,
            left: prefixIcon == null ? 20 : 0,
            // bottom: (currentFocus!.hasFocus || controller!.text!.isNotEmpty) ?-8:0
          ),
          hintText: hintText,
          fillColor: filledcolor ?? Colors.white,
          filled:
              // (currentFocus!.hasFocus || controller!.text.isNotEmpty)
              //     ? false
              //     :
              true,
          // fillColor: (currentFocus?.hasFocus ?? false)
          //     ? ColorUtils.fieldColor
          //     : ((controller?.text?.isEmpty ?? true)
          //         ? filledcolor
          //         : ColorUtils.fieldColor),
          prefixStyle: const TextStyle(color: Colors.white, fontSize: 16),
          // labelStyle: TextStyle(color: Colors.black, fontSize: 16, height: 1.2),

          hintStyle: TextStyle(
            // fontFamily: Font.Regular,
            color: hintColor ?? ColorUtils.slate.withOpacity(0.5),
            fontSize: 13.sp,
          ),
          labelText: labelText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
              color: (currentFocus?.hasFocus ?? false)
                  ? ColorUtils.white
                  : ((controller?.text.isEmpty ?? true)
                      ? ColorUtils.white.withOpacity(0.5)
                      : ColorUtils.white),
              fontSize: (currentFocus?.hasFocus ?? false) ||
                      ((controller?.text.isNotEmpty ?? true))
                  ? 14.sp
                  : 12.sp,
              // fontFamily: Font.Medium,
              height: 1.2),
          suffixIcon: needSuffix == true
              ? suffixWidget
              : isPassword
                  ? IconButton(
                      splashColor: Colors.transparent,
                      icon: (obscure)
                          ? Icon(
                              Icons.visibility_off,
                              size: 30.sp,
                            )
                          : Icon(Icons.visibility),
                      color: (obscure)
                          ? const Color(0xff7c849c)
                          : ColorUtils.black,
                      onPressed: suffixClick,
                    )
                  : isDropDown
                      ? SizedBox(
                          width: 1.w,
                          height: 15,
                          child: Image.asset(
                            suffixIcon!,
                            scale: 3.5,
                            color: ColorUtils.txtGrey,
                          ),
                        )
                      : suffixIcon != null
                          ? GestureDetector(
                              onTap: suffixClick,
                              child: Image.asset(
                                suffixIcon!,
                                scale: 2.5,
                              ),
                            )
                          : null,
          prefixIcon: prefixiconData != null
              ? Icon(
                  prefixiconData,
                  color: ColorUtils.white,
                  size: 20,
                )
              : prefixIcon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 17),
                        Image.asset(
                          prefixIcon!,
                          color: (currentFocus?.hasFocus ?? false)
                              ? null
                              : ((controller?.text.isEmpty ?? true)
                                  ? ColorUtils.red.withOpacity(0.4)
                                  : ColorUtils.red),
                          scale: 2,
                        ),
                        const SizedBox(width: 10),
                      ],
                    )
                  : null,
          // disabledBorder: InputBorder.none,
          errorStyle: TextStyle(color: ColorUtils.red),
          // enabledBorder: GradientOutlineInputBorder(
          //   borderRadius: BorderRadius.circular(18),
          //   width: 1.5.sp,
          //   gradient: (currentFocus?.hasFocus ?? false)
          //       ? LinearGradient(colors: [ColorUtils.pink, ColorUtils.cold])
          //       : ((controller?.text.isEmpty ?? true)
          //           ? const LinearGradient(
          //               colors: [Colors.transparent, Colors.transparent])
          //           : LinearGradient(
          //               colors: [ColorUtils.pink, ColorUtils.cold])),
          // ),
          // focusedBorder: GradientOutlineInputBorder(
          //   borderRadius: BorderRadius.circular(18),
          //   width: 1.5.sp,
          //   gradient: (currentFocus?.hasFocus ?? false)
          //       ? LinearGradient(colors: [ColorUtils.pink, ColorUtils.cold])
          //       : ((controller?.text.isEmpty ?? true)
          //           ? const LinearGradient(
          //               colors: [Colors.transparent, Colors.transparent])
          //           : LinearGradient(
          //               colors: [ColorUtils.pink, ColorUtils.cold])),
          // ),

          // errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(18),
          //     borderSide: BorderSide(
          //         color: ((controller?.text.isEmpty ?? true)
          //             ? ColorUtils.red
          //             : ColorUtils.red))),
          // focusedErrorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(18),
          //     borderSide: BorderSide(
          //         color: ((controller?.text.isEmpty ?? true)
          //             ? ColorUtils.red
          //             // ColorUtils.black.withOpacity(0.4)
          //             : ColorUtils.red))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: ColorUtils.borderColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: ColorUtils.borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: ColorUtils.borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: ColorUtils.borderColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: ColorUtils.borderColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: ColorUtils.borderColor,
            ),
          ),
        ),
      ),
    );
  }

  _fieldFocusChange(
      /*BuildContext context,*/ FocusNode? currentFocus, FocusNode? nextFocus) {
    currentFocus?.unfocus();
    if (nextFocus != null)
      FocusScope.of(navigationKey.currentContext!).requestFocus(nextFocus);
  }
}
