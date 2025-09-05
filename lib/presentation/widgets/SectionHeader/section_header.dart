import 'package:flutter/material.dart';
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final Widget? actionWidget;
  final VoidCallback? onActionPressed;
  final TextStyle? titleStyle;
  final TextStyle? actionStyle;
  final EdgeInsetsGeometry? padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.actionWidget,
    this.onActionPressed,
    this.titleStyle,
    this.actionStyle,
    this.padding,
  }) : assert(actionText == null || actionWidget == null,
  'Cannot provide both actionText and actionWidget');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ?? theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (actionWidget != null) actionWidget!
          else if (actionText != null || onActionPressed != null)
            GestureDetector(
              onTap: onActionPressed,
              child: Text(
                actionText ?? 'See All',
                style: actionStyle ?? theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}