import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';

class IconContainer extends StatelessWidget {
  final String assetPath;
  final double size;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? imageColor;
  final BorderRadius? borderRadius;

  const IconContainer({
    super.key,
    required this.assetPath,
    this.size = 40,
    this.padding = const EdgeInsets.all(8),
    this.backgroundColor,
    this.imageColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surfaceDim,
        borderRadius: borderRadius ?? AppBorderRadius.roundedSmall,
      ),
      child: Image.asset(
        assetPath,
        color: imageColor ?? Theme.of(context).colorScheme.primary,
        height: size,
        width: size,
      ),
    );
  }
}




class TextBackground extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;

  const TextBackground({
    super.key,
    required this.text,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    this.backgroundColor,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surfaceDim,
        borderRadius: borderRadius ?? AppBorderRadius.roundedSmall,
      ),
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

