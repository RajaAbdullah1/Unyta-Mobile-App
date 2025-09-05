import 'package:flutter/material.dart';

import '../../../core/styles/app_paddings.dart';
import '../AchievementCard/achievement_card.dart';
import '../BadgeAndRewardCard/badge_and_reward_card.dart';
import '../BadgeCard/badge_card.dart';

class ProofApprovedTab extends StatelessWidget {
  const ProofApprovedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppPaddings.all16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Badge", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 12,),
          BadgeCard(
            borderColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).colorScheme.surfaceDim,
            leadingImagePath: "assets/images/silver_badge.png",
            title: "5 campaigns submitted",
            subtitle: "Silver Badge unlocked",
            trailingImagePath: "assets/images/cursor.png",
          ),
          const SizedBox(height: 12),
          AchievementCard(
            padding: AppPaddings.all14,
            showCheckmark: false,
            imageSize: 35,
            assetPath: "assets/images/completed_campaigns.png",
            progressText: "approved proof count",
            achievementText: "9 out of 13 are approved",
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return BadgeAndRewardCard(
                status: "Approved",
                brandImagePath: "assets/images/reviewImage.png",
                description:
                "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
                title: "Glow-Up Essentials Gifting Campaign",
                statusDescription: "Proof approved, Google review done",
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 8,
          ),
        ],
      ),
    );
  }
}
