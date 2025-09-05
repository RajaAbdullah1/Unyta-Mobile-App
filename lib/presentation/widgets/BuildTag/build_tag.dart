import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';

// build_tag.dart
Widget buildTag(BuildContext context, String text, {bool isSelected = false}) {
  return Container(
    decoration: BoxDecoration(
      color:
          isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).cardColor,
      borderRadius: AppBorderRadius.roundedLarge,
      border: Border.all(
        color:
            isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
