import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../../widgets/AboutCreatorCard/about_creator_card.dart';
import '../../../../widgets/ActionButton/action_button.dart';
import '../../../../widgets/CampaignBirefBrandCard/campaign_brief_brand_card.dart';
import '../../../../widgets/CampaignDesCard/campaign_des_card.dart';
import '../../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../widgets/HeadingSection/heading_section.dart';

class OngoingDetailScreen extends StatefulWidget {
  const OngoingDetailScreen({super.key,});

  @override
  State<OngoingDetailScreen> createState() => _OngoingDetailScreenState();
}

class _OngoingDetailScreenState extends State<OngoingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Campaign Brief",
        subtitle:
            "Review your campaign and mark as completed if you're happy to move forward.",
        height: MediaQuery.of(context).size.height * 0.18,
      ),
      body: ListView(
        padding: AppPaddings.all16,
        children: [
          CampaignBriefBrandCard(
            statusValue: "Waiting for Creator",
            status: "requested",
            brandImagePath: "assets/images/reviewImage.png",
            description:
                "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
            title: "Glow-Up Gifting Campaign",
          ),
          SizedBox(height: 20),
          headingSection(
            "About Creator",
            "Get to know who you’re collaborating with",
              context
          ),
          SizedBox(height: 10),
          ...List.generate(2, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: AboutCreatorCard(
                name: "Olivia Jen",
                username: "@olivia.style",
                imagePath: "assets/images/match.png",
                status: "Proof Pending",
                viewProfileOnTap: () {
                  Navigator.pushNamed(context, AppRoutes.reviewSubmittedContentScreen);
                },
                onTap: () {
                  debugPrint("View Profile clicked for Olivia Jen");
                },
              ),
            );
          }),
          SizedBox(height: 20),
          headingSection("Collaboration Details", "Get to know the brief", context),
          SizedBox(height: 20),
          CampaignDesCard(
            title: "What’s Included",
            cardName: "whatsIncluded",
            secondLastTitle: "Shipping Info:",
            secondLastValue: "Ships within 3–5 business days after approval",
            lastTitle: "Product Status:",
            lastValue: "Shipped by Brand",
            isHideProductStatus: true,
          ),
          SizedBox(height: 20),
          CampaignDesCard(
            title: "Content Requirements",
            cardName: "contentRequirement",
            secondLastTitle: "Content Due Date:",
            secondLastValue: "May 5, 2025",
            lastTitle: "Hashtags/Mentions:",
            lastValue: "#GlowWithSkinTreats   @skintreats",
          ),
          SizedBox(height: 20),
          CampaignDesCard(
            title: "Who This Is For",
            cardName: "who",
            secondLastTitle: "Ideal Creator:",
            secondLastValue: "Skincare, wellness, or lifestyle nich",
            lastTitle: "Follower Range:",
            lastValue: "5K – 100K",
          ),
          SizedBox(height: 80),
        ],
      ),
      bottomSheet: Container(
        color: Theme.of(context).colorScheme.surfaceBright,
        padding: AppPaddings.all16,
        child: ActionButton(
          backgroundColor: Theme.of(context).colorScheme.surfaceBright,
          borderColor: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.primary,
          onPressed: () {

          },
          text: "Mark as Completed",
        ),
      ),
    );
  }


}
