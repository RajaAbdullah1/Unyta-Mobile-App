import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? loaderColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final double? paddingHorizontal;
  final double? buttonWidth;
  final double? buttonHeight;
  final FontWeight? fontWeight;
  final double? fontSize;
  final BorderRadius? buttonRadius;
  final bool loader;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.loaderColor,
    this.borderColor,
    this.paddingHorizontal,
    this.buttonWidth,
    this.buttonHeight,
    this.fontWeight,
    this.fontSize,
    this.buttonRadius,
    this.loader = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeStyle = Theme.of(context).elevatedButtonTheme.style;
    final screenHeight = MediaQuery.of(context).size.height;

    // Theme default text style
    final defaultTextStyle = themeStyle?.textStyle?.resolve({}) ??
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

    return ElevatedButton(
      style: themeStyle?.copyWith(
        // Always fix hover/pressed shadow
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: backgroundColor != null
            ? WidgetStatePropertyAll(backgroundColor)
            : themeStyle?.backgroundColor,
        foregroundColor: textColor != null
            ? WidgetStatePropertyAll(textColor)
            : themeStyle?.foregroundColor,
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: buttonRadius ?? AppBorderRadius.roundedLarge,
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(buttonWidth ?? double.infinity, buttonHeight ?? screenHeight * 0.07),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 16.0),
        ),
      ),
      onPressed: loader ? null : onPressed,
      child: loader
          ? Center(
        child: SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: loaderColor ??
                (textColor ?? Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      )
          : Text(
        text,
        textAlign: TextAlign.center,
        style: defaultTextStyle.copyWith(
          fontSize: fontSize ?? defaultTextStyle.fontSize,
          fontWeight: fontWeight ?? defaultTextStyle.fontWeight,
          color: textColor ?? defaultTextStyle.color,
        ),
      ),
    );
  }
}
