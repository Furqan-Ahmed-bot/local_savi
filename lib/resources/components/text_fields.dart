// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_saviors/resources/extensions/context_extension.dart';

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
  final int? minLine;
  final int? maxLine;
  final Color? hintColor;
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
    this.hintColor,
    this.iconH,
    this.iconW,
    this.readOnly = false,
    this.controller,
    this.onTap,
    this.initialValue,
    this.suffixIcon,
    this.radius,
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
                                scale: 1.6,
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
