import 'package:flutter/material.dart';
import 'package:unyta/data/models/InfoSectionParagraphModel/info_section_pararaph.dart';
import '../AchievementCard/achievement_card.dart';
import '../AudianceOverviewSection/audiance_overview_section.dart';
import '../BadgeSection/badge_section.dart';
import '../BioSection/bio_section.dart';
import '../CollabPreferenceSection/collab_preference_section.dart';
import '../ContentStyleSection/content_style_section.dart';
import '../TagWrape/tag_wrap.dart';
import '../UpgradedCard/upgraded_card.dart';

class AboutTab extends StatelessWidget {
  final String role;
  const AboutTab({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceDim,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children:  [
          SizedBox(height: 16),
          UpgradeCard(),
          SizedBox(height: 16),
          BioSection(
            role: role,
            about: "About Olivia",
            description: "Beauty creator focused on skincare routines and real-life product reviews with a minimalist vibe.",
          ),
          SizedBox(height: 16),
          TagsWrap(),
          SizedBox(height: 16),
          ContentStyleSection(
            role: role,
          ),
          SizedBox(height: 16),
          CollabPreferencesSection(
            role: role,
          ),
          SizedBox(height: 16),
          AudienceOverviewSection(
            role: role,
            heading: "Audience Overview",
            items: [
              InfoSectionParagraphModel(title: "Primary Location", text: "UK"),
              InfoSectionParagraphModel(title: "Gender", text: "Male - Female"),
              InfoSectionParagraphModel(title: "Age Range", text: "18-24"),
            ],
            onEdit: () {
              print("Edit Audience Overview");
            },
          ),

          SizedBox(height: 16),
          Text(
            "What to achieve next",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          AchievementCard(
            assetPath: "assets/images/simple_badge.png",
            progressText: "3 of 5 uploads completed",
            achievementText: "2 more to unlock Gold Badge",
          ),
          SizedBox(height: 16),
          BadgeSection(showTitle: true,),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
