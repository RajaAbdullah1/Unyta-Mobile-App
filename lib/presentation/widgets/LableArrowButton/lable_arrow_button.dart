import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';

class LabelArrowButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? arrowColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final double? borderRadius;
  final double? paddingHorizontal;
  final double? buttonWidth;
  final double? buttonHeight;
  final FontWeight? fontWeight;
  final double? fontSize;
  final IconData? arrowIcon;
  final String labelAlignment; // "start", "center", "end"
  final Widget? startImage; // optional image at start

  const LabelArrowButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.arrowColor,
    this.borderColor,
    this.borderRadius,
    this.paddingHorizontal,
    this.buttonWidth,
    this.buttonHeight,
    this.fontWeight,
    this.fontSize,
    this.arrowIcon,
    this.labelAlignment = "start",
    this.startImage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).elevatedButtonTheme.style;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonFontSize = fontSize ?? screenWidth * 0.045;

    return ElevatedButton(
      style: theme?.copyWith(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? theme.backgroundColor?.resolve({}),
        ),
        foregroundColor: WidgetStatePropertyAll(
          textColor ?? theme.foregroundColor?.resolve({}),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius:
                borderRadius != null
                    ? BorderRadius.circular(borderRadius!)
                    : AppBorderRadius.roundedLarge,
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(
            buttonWidth ?? double.infinity,
            buttonHeight ?? screenHeight * 0.07,
          ),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 16.0),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Show image on start
          if (startImage != null) ...[startImage!, const SizedBox(width: 8)],

          // TEXT handling
          if (labelAlignment == "start")
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: theme?.textStyle
                      ?.resolve({})
                      ?.copyWith(
                        fontSize: buttonFontSize,
                        fontWeight: fontWeight,
                        color: textColor,
                      ),
                ),
              ),
            )
          else if (labelAlignment == "center")
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: theme?.textStyle
                      ?.resolve({})
                      ?.copyWith(
                        fontSize: buttonFontSize,
                        fontWeight: fontWeight,
                        color: textColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          else if (labelAlignment == "end")
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  text,
                  style: theme?.textStyle
                      ?.resolve({})
                      ?.copyWith(
                        fontSize: buttonFontSize,
                        fontWeight: fontWeight,
                        color: textColor,
                      ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),

          // Arrow Icon (always at the end)
          if(arrowIcon != null)
          Icon(
            arrowIcon,
            size: buttonFontSize * 1.5,
            color: arrowColor ?? textColor ?? Colors.white,
          ),
        ],
      ),
    );
  }
}
