import 'package:flutter/material.dart';
import 'package:unyta/routes/app_routes.dart';
import '../ActionButton/action_button.dart';
import '../BrandInfoCard/brand_info_card.dart';
import '../CampignBriefCard/campaign_brief_card.dart';
import '../DualActionButton/dual_action_button.dart';
import '../StatusBadge/status_badge.dart';
import '../SubmittedProofBottomSheet/submitted_proof_bottomSheet.dart';
import '../TextFieldWidget/text_field_widget.dart';

void campaignReviewBottomSheet(
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
              "Paris Campaign",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            CampaignBriefCard(
              status: "",
              brandImagePath: "assets/images/reviewImage.png",
              description: "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
              title: "Glow-Up Essentials Gifting Campaign",
            ),
            const SizedBox(height: 12),
            BrandInfoCard(
              brandName: "Skin Treats",
              brandDescription:
              "Create content in exchange for curated offerings.",
              brandImagePath: "assets/images/reviewImage.png",
              websiteUrl: "www.skintreats.co",
              instagramHandle: "@skintreats",
            ),
            const SizedBox(height: 24),
            ActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.campaignBriefScreen, arguments: "viewCampaign");
              },
              text: "View Campaign",
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
