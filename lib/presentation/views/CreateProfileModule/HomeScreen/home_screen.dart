import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/HomeInfoCard/home_info_card.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../widgets/BrandCard/brand_card.dart';
import '../../../widgets/CampaignCard/compaign_card.dart';
import '../../../widgets/HomeAppBar/home_app_bar.dart';
import '../../../widgets/SectionHeader/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "Oliva",
        profileImagePath: "assets/images/Image profile.png",
        onProfileTap: () {
          Navigator.pushNamed(context, AppRoutes.profileDetailScreen1, arguments: "creator");
        },
      ),
      body: ListView(
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
                  title: "Completed Campaigns",
                  value: "05",
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SectionHeader(title: "Active Campaigns", actionText: "See All"),
          SizedBox(height: 16),
          CampaignCard(
            title: "Spring Style Essentials",
            subtitle: "3-piece outfit",
            date: "May 14, 2025",
            locationLabel: "Campaign location:",
            location: "Spring Style Essentials",
            deliverablesLabel: "Deliverables:",
            deliverables: "1 Reel + 2 IG stories",
            isShowIcons: false,
          ),
          SizedBox(height: 16),
          SectionHeader(title: "Newest Brands", actionText: "See All"),
          SizedBox(height: 16),
          ...List.generate(5, (index) {
            return Column(
              children: [
                BrandCard(
                  imagePath: "assets/images/reviewImage.png",
                  title: "Skin treats",
                  description: "Create content in exchange for curated offerings.",
                  onTap: () {
                    // Handle tap
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
