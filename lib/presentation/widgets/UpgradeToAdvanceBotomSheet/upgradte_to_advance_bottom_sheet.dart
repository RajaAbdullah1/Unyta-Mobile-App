import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/IconContainer/icon_container.dart';
import '../../../core/styles/app_border_radius.dart';
import '../ActionButton/action_button.dart';

void upgradeToAdvanceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Text(
              "Upgrade to Advanced",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: AppBorderRadius.roundedMedium,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/crown.png",
                    color:  Theme.of(context).colorScheme.surfaceContainerHigh,
                    height: 20,
                    width: 20,
                  ),
                  IconContainer(assetPath: "assets/images/crown.png", imageColor: Theme.of(context).colorScheme.surfaceContainerHighest,),
                  const SizedBox(height: 10),
                  Text(
                    "Unlock Map Visibility",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Find nearby creators on the map and chat directly, connecting beyond brand collabs.",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.pop(context);
              },
              text: "Select Plan",
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
