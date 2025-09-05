import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';

class UpgradeToAdvancedButton extends StatelessWidget {
  final VoidCallback onTap;

  const UpgradeToAdvancedButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          color:  Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: AppBorderRadius.roundedLarge,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/crown.png",
              color: Theme.of(context).colorScheme.surface,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 10),
            Text(
              "Upgrade to Advanced",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}