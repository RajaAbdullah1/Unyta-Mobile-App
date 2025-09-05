import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/core/styles/app_border_radius.dart';

import '../IconContainer/icon_container.dart';

class AlreadyAdvanceSubscriptionCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final String actionText;
  final IconData actionIcon;
  final VoidCallback? onActionTap;

  const AlreadyAdvanceSubscriptionCard({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.actionText,
    required this.actionIcon,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all16,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceDim,
        ),
        borderRadius: AppBorderRadius.roundedMedium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconContainer(assetPath: iconPath),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: onActionTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(actionText),
                      const SizedBox(width: 4),
                      Icon(actionIcon),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



