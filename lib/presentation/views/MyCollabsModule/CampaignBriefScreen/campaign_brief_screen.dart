import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/ActionButton/action_button.dart';
import '../../../widgets/BrandInfoCard/brand_info_card.dart';
import '../../../widgets/CampaignDesCard/campaign_des_card.dart';
import '../../../widgets/CampignBriefCard/campaign_brief_card.dart';
import '../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../widgets/DualActionButton/dual_action_button.dart';

class CampaignBriefScreen extends StatefulWidget {
  final String? status;
  const CampaignBriefScreen({super.key,this.status});

  @override
  State<CampaignBriefScreen> createState() => _CampaignBriefScreenState();
}

class _CampaignBriefScreenState extends State<CampaignBriefScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Campaign Brief",
        subtitle: "Review campaign details and proceed if you are interested in collaborating.",
        height: MediaQuery.of(context).size.height * 0.18,
      ),
      body: ListView(
        padding: AppPaddings.all16,
        children: [
          CampaignBriefCard(
            status: widget.status,
            brandImagePath: "assets/images/reviewImage.png",
            description: "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
            title: "Glow-Up Essentials Gifting Campaign",
          ),
          SizedBox(height: 20,),
          widget.status == "requested" ?   BrandInfoCard2(
            brandName: "Skin Treats",
            brandDescription:
            "Verified Brand",
            brandImagePath: "assets/images/reviewImage.png",
            websiteUrl: "www.skintreats.co",
            instagramHandle: "@skintreats",
          ) :
          BrandInfoCard(
            brandName: "Skin Treats",
            brandDescription:
            "Create content in exchange for curated offerings.",
            brandImagePath: "assets/images/reviewImage.png",
            websiteUrl: "www.skintreats.co",
            instagramHandle: "@skintreats",
          ),
          SizedBox(height: 20,),
          CampaignDesCard(
            title: "What’s Included",
            cardName: "whatsIncluded",
            secondLastTitle: "Shipping Info:",
            secondLastValue: "Ships within 3–5 business days after approval",
            lastTitle: "Product Status:",
            lastValue: "Shipped by Brand",
          ),
          SizedBox(height: 20,),
          CampaignDesCard(
            title: "Content Requirements",
            cardName: "contentRequirement",
            secondLastTitle: "Content Due Date:",
            secondLastValue: "May 5, 2025",
            lastTitle: "Hashtags/Mentions:",
            lastValue: "#GlowWithSkinTreats   @skintreats",
          ),
          SizedBox(height: 20,),
          CampaignDesCard(
            title: "Who This Is For",
            cardName: "who",
            secondLastTitle: "Ideal Creator:",
            secondLastValue: "Skincare, wellness, or lifestyle nich",
            lastTitle: "Follower Range:",
            lastValue: "5K – 100K",
          ),
          SizedBox(height:widget.status != null ? 20 : 80,),
        ],
      ),
      bottomSheet: widget.status == null
          ? const SizedBox()
          : Container(
        color: Theme.of(context).colorScheme.surfaceBright,
        padding: AppPaddings.all16,
        child: widget.status == "viewCampaign"
            ? ActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          borderColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            // TODO: Handle collaborate action
          },
          text: "Collaborate",
        )
            : DualActionButtons(
          leftButtonText: "Check Status",
          onLeftPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.proofSubmittedScreen,
            );
          },
          rightButtonText: "Collaborate",
          onRightPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.previouslyUploadedProofScreen,
            );
            // TODO: Handle collaborate action
          },
        ),
      ),
    );
  }
}
