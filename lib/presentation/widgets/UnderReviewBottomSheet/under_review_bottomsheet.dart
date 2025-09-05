import 'package:flutter/material.dart';
import '../ActionButton/action_button.dart';
import '../HorizontalImageScrollable/horizontal_image_scrollable.dart';
import '../StatusBadge/status_badge.dart';

void underReviewBottomSheet(BuildContext context, String status) {
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
              "Submitted Proofs",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "IG Post",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: HorizontalImageScroller(
                images: [
                  "assets/images/collab_history_image.png",
                  "assets/images/collab_history_image.png",
                  "assets/images/collab_history_image.png",
                  "assets/images/collab_history_image.png",
                  "assets/images/collab_history_image.png",
                  "assets/images/collab_history_image.png",
                  "assets/images/collab_history_image.png",
                  "assets/images/collab_history_image.png",
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Activity:",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                StatusBadge(
                  text: status,
                  horizontalPadding: 16,
                  verticalPadding: 8,
                  color: Colors.transparent,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date Submitted",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "July 09, 2025",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ActionButton(
              textColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.pop(context);
              },
              text: "Close",
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
