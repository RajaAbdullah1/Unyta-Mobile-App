import 'package:flutter/material.dart';
import '../../../core/styles/app_colors.dart';
import '../ActionButton/action_button.dart';
import '../BrandInfoCard/brand_info_card.dart';
import '../CampaignBottomCard/compaign_bottom_card.dart';

class CampaignBottomSheet extends StatelessWidget {
  const CampaignBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 50,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                // Title
                Text(
                  "Collaboration with Glow Rituals",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                CampaignCard(
                  imagePath: "assets/images/collab_history_image.png",
                  title: "Glow Rituals",
                  status: "Approved",
                  offer: "Free skincare kit",
                  date: "May 14, 2025",
                  location: "Italy, shipped EU-wide",
                  deliverables: "1 Reel + 2 IG stories",
                  statusColor:
                      Theme.of(context).colorScheme.surfaceDim, // optional
                  imageHeight: 200, // optional
                ),
                const SizedBox(height: 16),
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
                  text: "View Campaign",
                  onPressed: () {
                    // handle click
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
