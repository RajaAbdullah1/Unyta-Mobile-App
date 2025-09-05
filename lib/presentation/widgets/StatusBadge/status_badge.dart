import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String text;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? color;
  final Color? textColor;
  final Color? background;
  final VoidCallback? onTap;
  final String? icon;
  const StatusBadge({
    super.key,
    required this.text,
     this.horizontalPadding,
     this.verticalPadding,
     this.color,
     this.background,
     this.textColor,
     this.icon,
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: horizontalPadding ??  12, vertical: verticalPadding ??  12),
        decoration: BoxDecoration(
          color: background ?? Theme.of(context).colorScheme.surfaceDim,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color ??  Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(icon != null)
            Row(
              children: [
                Image.asset(icon!, height: 20, width: 20,),
                SizedBox(width: 5,)
              ],
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor ??  Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
