import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/DualActionButton/dual_action_button.dart';
import 'package:unyta/routes/app_routes.dart';
import '../HorizontalImageScrollable/horizontal_image_scrollable.dart';
import '../StatusBadge/status_badge.dart';
import '../UploadProofBrandBottomSheet/upload_proof_brand_bottomsheet.dart';

void submittedProofBrandBottomSheet(BuildContext context, String status, ) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      TextEditingController captionController = TextEditingController();
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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "message from creator",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),
                  Text(
                    "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            DualActionButtons(
              leftButtonText: "Request Revision",
              onLeftPressed: () {
                Navigator.pop(context);
                uploadProofBrandBottomSheet(context,captionController);
              },
              rightButtonText: "Approve",
              onRightPressed: () {
                Navigator.pushNamed(context, AppRoutes.campaignCompletedScreen);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
