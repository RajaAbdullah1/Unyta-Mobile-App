import 'package:flutter/material.dart';
import '../CreatorDetailCard/creator_detail_card.dart';
import '../DualActionButton/dual_action_button.dart';
import '../StatusBadge/status_badge.dart';
import '../SubmittedProofBottomSheet/submitted_proof_bottomSheet.dart';
import '../TextFieldWidget/text_field_widget.dart';

void creatorBottomSheet(
    BuildContext context,
    ) {
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
              "Creator Detail",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            CreatorDetailCard(
              creatorName: "Skin Treats",
              brandDescription:
              "Create content in exchange for curated offerings.",
              brandImagePath: "assets/images/match.png",
              websiteUrl: "@olivia.style",
              instagramHandle: "@skintreats",
            ),
            const SizedBox(height: 24),
            DualActionButtons(
              leftButtonText: "View Profile",
              onLeftPressed: () {
                Navigator.pop(context);
              },
              rightButtonText: "Chat with Creator",
              onRightPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
