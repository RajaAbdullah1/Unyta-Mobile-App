import 'package:unyta/presentation/widgets/SwitchAccountTile/switch_account_tile.dart';
import 'package:flutter/material.dart';

void switchAccountBottomSheet(BuildContext context) {
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
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Text(
              "Switch account",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const SwitchAccountTile(
              imagePath: "assets/images/match.png",
              name: "Olivia Jen",
              username: "@olivia.jen",
              isSelected: true,
            ),
            const SizedBox(height: 30),
            const SwitchAccountTile(isAddTile: true, isSelected: false,),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
