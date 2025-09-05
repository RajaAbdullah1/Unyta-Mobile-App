import 'package:flutter/material.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_paddings.dart';
import '../ActiveCampaignBrandCard/active_campaign_brand_card.dart';
import '../BrandCampaignBottomSheet/brand_campaign_bottomsheet.dart';
import '../SectionHeader/section_header.dart';

class BrandHistoryCollabTab extends StatefulWidget {
  const BrandHistoryCollabTab({super.key});

  @override
  State<BrandHistoryCollabTab> createState() => _BrandHistoryCollabTabState();
}

class _BrandHistoryCollabTabState extends State<BrandHistoryCollabTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceDim,
      child: ListView(
        padding: AppPaddings.horizontal16,
        children: [
          const SizedBox(height: 16),
          SectionHeader(
            title: "Previous Collaborations",
            actionText: "See All",
            onActionPressed: () {
              Navigator.pushNamed(context, AppRoutes.campaignHistoryScreen);
            },
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: 0.4, // 40% of available width
              child: Container(
                padding: AppPaddings.all8,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceDim,
                  borderRadius: AppBorderRadius.roundedSmall,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Completed : 06",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
          ...List.generate(5, (index) {
            return InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const BrandCampaignBottomSheet(),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child:   ActiveCampaignBrandCard(
                  imagePath: "assets/images/collab_history_image.png",
                  title: "Spring Skincare Gifting",
                  status: "Completed",
                  offer: "Free skincare kit",
                  date: "May 14, 2025",
                  statusColor:
                  Theme.of(context).colorScheme.surfaceDim, // optional
                  imageHeight: 200, // optional
                ),
              ),
            );
          }),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

}
