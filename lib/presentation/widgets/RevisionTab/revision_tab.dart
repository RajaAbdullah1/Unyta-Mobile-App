import 'package:flutter/material.dart';

import '../../../core/styles/app_paddings.dart';
import '../BadgeAndRewardCard/badge_and_reward_card.dart';

class RevisionTab extends StatelessWidget {
  const RevisionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: AppPaddings.all16,
        itemBuilder: (context, index) {
          return  BadgeAndRewardCard(
            status: "Revision",
            brandImagePath: "assets/images/reviewImage.png",
            description: "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
            title: "Glow-Up Essentials Gifting Campaign",
            statusDescription: "Upload proof again",
          );
        }, separatorBuilder: (context, index) => SizedBox(height: 16,), itemCount: 8);
  }
}
