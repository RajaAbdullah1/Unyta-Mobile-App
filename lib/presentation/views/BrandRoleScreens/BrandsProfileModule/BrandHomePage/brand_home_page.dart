import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/ActiveCampaignBrandCard/active_campaign_brand_card.dart';
import 'package:unyta/presentation/widgets/HomeInfoCard/home_info_card.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../widgets/HomeAppBar/home_app_bar.dart';
import '../../../../widgets/NewCreatorCard/new_creator_card.dart';
import '../../../../widgets/SectionHeader/section_header.dart';

class BrandHomePage extends StatefulWidget {
  const BrandHomePage({super.key});

  @override
  State<BrandHomePage> createState() => _BrandHomePageState();
}

class _BrandHomePageState extends State<BrandHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "Oliva",
        profileImagePath: "assets/images/reviewImage.png",
        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.brandProfileScreen);
        },
      ),
      body: ListView(
        physics: PageScrollPhysics(),
        padding: AppPaddings.all16,
        children: [
          Row(
            children: [
              Expanded(
                child: HomeInfoCard(
                  iconPath: "assets/images/active_campaigns.png",
                  title: "Active Campaigns",
                  value: "02",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: HomeInfoCard(
                  iconPath: "assets/images/completed_campaigns.png",
                  title: "Completed",
                  value: "05",
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SectionHeader(title: "Active Campaigns", actionText: "See All"),
          SizedBox(height: 16),
          ActiveCampaignBrandCard(
            imagePath: "assets/images/collab_history_image.png",
            title: "Spring Skincare Gifting",
            status: "Active",
            offer: "Free skincare kit",
            date: "May 14, 2025",
            statusColor:
            Theme.of(context).colorScheme.surfaceDim, // optional
            imageHeight: 200, // optional
          ),
          SizedBox(height: 16),
          SectionHeader(title: "Newest Creators", actionText: "See All", onActionPressed: () => Navigator.pushNamed(context, AppRoutes.newestCreatorScreen),),
          SizedBox(height: 16),
          ...List.generate(5, (index) {
            return Column(
              children: [
                CreatorCard(
                  name: "Olivia Jen",
                  username: "@olivia.style",
                  imagePath: "assets/images/match.png",
                  onTap: () {
                    debugPrint("View Profile clicked for Olivia Jen");
                  },
                ),
                SizedBox(height: 10),
              ],
            );
          }),
        ],
      ),
    );
  }
}
