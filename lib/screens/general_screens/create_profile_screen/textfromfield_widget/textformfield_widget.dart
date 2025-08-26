// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelTextFormFieldWidget extends StatelessWidget {
  LabelTextFormFieldWidget({
    this.height = 100,
    this.width = 200,
    this.controller,
    this.labeltext = 'Label text',
    this.suffixicon,
    this.readOnly = false,
    this.issufficsenable = false,
    this.maxlines = 1,
    this.ontap,
    this.onChange,
    this.validation,
    this.onFulltap,
    this.onSubmitted,
    super.key,
  });
  double height;
  double width;
  bool? readOnly;
  final TextEditingController? controller;
  String labeltext;
  bool issufficsenable;
  final suffixicon;
  int maxlines;
  final String? Function(String?)? validation;
  final Function()? ontap;
  final Function()? onFulltap;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // can customize height
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffDBE2EC)),
        color: Colors.white,
      ),
      child: TextFormField(
        onTap: readOnly! ? onFulltap : null,
        readOnly: readOnly!,
  validator: (value) {
            final errorText = validation!.call(value);

            // // If going from valid → invalid: trigger animation
            // if (errorText != null && _lastError == null) {
            //   triggerErrorAnimation();
            // }

            // // Update the last error state
            // _lastError = errorText;
            return errorText;
          },
        cursorColor: Colors.black,
        onFieldSubmitted: onSubmitted,
        onChanged: onChange,
        controller: controller,
        maxLines: maxlines,
        decoration: InputDecoration(
          suffixIcon: issufficsenable
              ? InkWell(
                  onTap: ontap,
                  child: Image.asset(
                    suffixicon,
                    scale: 1.1,
                  ))
              : null,
          hintText: labeltext,
          hintStyle: TextStyle(
            color: Color(0xffA5A5A5),
            fontSize: 16.0,
            letterSpacing: 0,
          ),
          border: InputBorder.none,

          contentPadding: EdgeInsets.only(
              bottom: issufficsenable ? 10 : 15,
              top: maxlines > 1
                  ? 10
                  : 0.0), // this can adjust the label and text position
          filled: true,
          fillColor: Colors.transparent, //or transparent
        ),
        textAlignVertical: TextAlignVertical.bottom,
      ),
    );
  }
}





class CustomTextFormField extends StatefulWidget {
  final IconData? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final String hintText;
  final bool isPassword;
  final bool isOnlyDigits;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;
  final Color fillColor;
  final double fontSize;
  final double iconSize;
  final double width;
  final double? height;
  final int maxLines;
  final int? maxLength;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final bool floatingLabelAlways;
  final FocusNode? focusNode;
  final int? errorMaxLines;
  final TextInputType? keyboardType;
  void Function(String)? onChanged;

  CustomTextFormField({
    Key? key,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.maxLength,
    this.isPassword = false,
    this.isOnlyDigits = false,
    this.iconColor =  Colors.red,
    this.textColor = Colors.black,
    this.borderColor = Colors.grey,
    this.fillColor = Colors.white,
    this.fontSize = 16.0,
    this.iconSize = 24.0,
    this.controller,
    this.validator,
    required this.width,
    this.height,
    this.contentPadding,
    this.floatingLabelAlways = true,
    this.focusNode,
    this.errorMaxLines = 2,
    this.maxLines = 1,
    this.readOnly = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  String? _lastError;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -4.0), weight: 1.0),
      TweenSequenceItem(tween: Tween(begin: -4.0, end: 4.0), weight: 2.0),
      TweenSequenceItem(tween: Tween(begin: 4.0, end: -2.0), weight: 1.5),
      TweenSequenceItem(tween: Tween(begin: -2.0, end: 2.0), weight: 1.0),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: -1.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: -1.0, end: 0.0), weight: 0.5),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void triggerErrorAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: AnimatedBuilder(
        animation: _shakeAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_shakeAnimation.value, 0),
            child: child,
          );
        },
        child: TextFormField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }

            // Revalidate only if there was a previous error
            if (_lastError != null) {
              final form = Form.of(context);
              if (form != null) {
                form.validate();
              }
            }
          },
          focusNode: widget.focusNode,
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          obscuringCharacter: "*",
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          cursorColor: Colors.black,
          style: TextStyle(color: widget.textColor, fontSize: widget.fontSize),
          keyboardType: widget.keyboardType ?? TextInputType.text,
          inputFormatters: widget.isOnlyDigits ? [FilteringTextInputFormatter.digitsOnly] : null,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(
                  vertical: (widget.height ?? 56.0) * 0.3,
                  horizontal: 20,
                ),
            prefixIcon: widget.prefixIcon ?? (widget.icon != null ? Icon(widget.icon, color: widget.iconColor, size: widget.iconSize) : null),
            // labelText: widget.label,
            // labelStyle: TextStyle(color: widget.textColor, fontSize: widget.fontSize),
            // floatingLabelBehavior: widget.floatingLabelAlways ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Color(0xffA5A5A5), fontSize: widget.fontSize , ),
            filled: true,
            fillColor: widget.fillColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDBE2EC), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: TextStyle(fontSize: widget.fontSize * 0.8, height: 1.0),
            errorMaxLines: widget.errorMaxLines,
            suffixIcon: widget.suffixIcon ??
                (widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: widget.iconColor,
                          size: widget.iconSize,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null),
          ),
          validator: (value) {
            final errorText = widget.validator?.call(value);

            // If going from valid → invalid: trigger animation
            if (errorText != null && _lastError == null) {
              triggerErrorAnimation();
            }

            // Update the last error state
            _lastError = errorText;
            return errorText;
          },
        ),
      ),
    );
  }
}
