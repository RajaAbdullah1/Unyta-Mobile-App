import 'package:flutter/material.dart';
import '../CampaignBirefBrandCard/campaign_brief_brand_card.dart';
import '../DualActionButton/dual_action_button.dart';
import '../TextFieldWidget/text_field_widget.dart';

void uploadProofBrandBottomSheet(
  BuildContext context,
  TextEditingController captionController,
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
              "Request Revision",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CampaignBriefBrandCard(
              status: "requested",
              brandImagePath: "assets/images/reviewImage.png",
              description:
                  "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
              statusValue: "Proof submitted, Review pending",
              title: "Glow-Up Gifting Campaign",
            ),
            SizedBox(height: 20),
            Text(
              "Feedback",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            TextFieldWidget(
              maxLines: 5,
              controller: captionController,
              hintText:
                  "Let the creator know what changes or new content you would like.",
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(height: 24),
            DualActionButtons(
              leftButtonText: "Cancel",
              onLeftPressed: () {
                Navigator.pop(context);
              },
              rightButtonText: "Send Feedback",
              onRightPressed: () {},
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
