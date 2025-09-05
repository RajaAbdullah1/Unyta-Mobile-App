import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_paddings.dart';
import '../ActionButton/action_button.dart';
import '../CampaignHistoryCard/campaign_history_card.dart';
import '../NewCreatorCard/new_creator_card.dart';

class BrandCampaignBottomSheet extends StatelessWidget {
  const BrandCampaignBottomSheet({super.key});
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
                      ).colorScheme.onSurface.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                // Title
                Text(
                  "Collaboration with Olivia Jen",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                CampaignHistoryCard(
                  imagePath: "assets/images/collab_history_image.png",
                  title: "Spring Style Essentials",
                  offer: "3-piece outfit",
                  date: "May 14, 2025",
                  location: "Italy, shipped EU-wide",
                  deliverables: "1 Reel + 2 IG stories",
                  statusColor:
                  Theme.of(context).colorScheme.surfaceDim, // optional
                  imageHeight: 200, // optional
                ),
                const SizedBox(height: 16),
               Container(
                 padding:  EdgeInsets.zero,
                 decoration: BoxDecoration(
                   borderRadius: AppBorderRadius.roundedMedium,
                   border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: AppPaddings.horizontal16,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const SizedBox(height: 12),
                           Text("About Creator", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600)),
                           const SizedBox(height: 8),
                           Text("Get to know who you’re collaborating with", style: Theme.of(context).textTheme.bodyLarge!.copyWith( color: Theme.of(context).colorScheme.onSecondary)),

                         ],
                       ),
                     ),
                     CreatorCard(
                       name: "Olivia Jen",
                       username: "@olivia.style",
                       imagePath: "assets/images/match.png",
                       onTap: () {
                         debugPrint("View Profile clicked for Olivia Jen");
                       },
                     ),
                   ],
                 ),
               ),
                const SizedBox(height: 24),
                ActionButton(
                  text: "Back",
                  onPressed: () {
                    // handle click
                  },
                  backgroundColor: Colors.transparent,
                  borderColor:  Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
