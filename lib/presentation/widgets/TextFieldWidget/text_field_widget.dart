import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final Function(String)? onChanged;
  final double? height;
  final double? width;
  final int maxLines;
  final int? maxLength;
  final bool obscureText;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintTextColor;
  final VoidCallback? onTap;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.onChanged,
    this.height,
    this.width,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.borderRadius,
    this.borderColor,
    this.fillColor,
    this.hintTextColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: maxLines,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        readOnly: readOnly,
        maxLength: maxLength,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor ??
                Theme.of(context).inputDecorationTheme.hintStyle?.color,
            fontSize:
            Theme.of(context).inputDecorationTheme.hintStyle?.fontSize,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor:
          fillColor ?? Theme.of(context).inputDecorationTheme.fillColor,
          filled: true,
          counterStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary, // 👈 apply theme color
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ??
                  (Theme.of(context).inputDecorationTheme.border
                  is OutlineInputBorder
                      ? (Theme.of(context).inputDecorationTheme.border
                  as OutlineInputBorder)
                      .borderSide
                      .color
                      : Colors.grey),
            ),
          ),

        ),
      ),
    );
  }
}

