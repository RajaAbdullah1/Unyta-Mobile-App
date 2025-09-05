import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/CategoryGrid/categroy_grid.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/InfoSectionParagraphModel/info_section_pararaph.dart';
import '../AchievementCard/achievement_card.dart';
import '../AudianceOverviewSection/audiance_overview_section.dart';
import '../BadgeSection/badge_section.dart';
import '../BioSection/bio_section.dart';
import '../CollabPreferenceSection/collab_preference_section.dart';
import '../ContentStyleSection/content_style_section.dart';
import '../TagWrape/tag_wrap.dart';
import '../UpgradedCard/upgraded_card.dart';

class BrandAboutTab extends StatelessWidget {
  const BrandAboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceDim,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children:  [
          BioSection(
            role: "creator",
            about: "About Skin Treats",
            description: "Discover the power of clean beauty. Skin Treats provides high-quality, eco-friendly skincare solutions for all genders. Our minimalist philosophy ensures a simple yet effective routine.",
          ),
          SizedBox(height: 16),
          AudienceOverviewSection(
            role: "creator",
            heading: "Creator Preferences",
            items: [
              InfoSectionParagraphModel(title: "Looking for:", text: "Beauty - Wellness - Fashion creators"),
              InfoSectionParagraphModel(title: "Location focus:", text: "UK, EU"),
              InfoSectionParagraphModel(title: "Min. followers:", text: "10k+"),
            ],
            onEdit: () {
              debugPrint("Edit Audience Overview");
            },
          ),
          SizedBox(height: 16),
          Text(
            "Brand Identity Tags",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          CategoryGrid(categories: AppConstants.brandIdentityTagsList, allowMultipleSelection: true,),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
