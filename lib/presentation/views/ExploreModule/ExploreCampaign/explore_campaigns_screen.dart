import 'package:flutter/material.dart';

import '../../../../routes/app_routes.dart';
import '../../../widgets/ActionButtonRow/action_button_row.dart';
import '../../../widgets/CustomPopUpMenu/custom_pop_up_menu.dart';
import '../../../widgets/ExploreCampaignCard/explore_campaign_card.dart';
import '../../../widgets/HomeAppBar/home_app_bar.dart';

class ExploreCampaignsScreen extends StatelessWidget {
  const ExploreCampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HomeAppBar(
        title: "Oliva",
        profileImagePath: "assets/images/Image profile.png",
        onProfileTap: () {},
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/explore_campaigns.png',
              fit: BoxFit.cover,
            ),
          ),

          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Bottom Card Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ExploreCampaignCard(
                avatarImagePath: 'assets/images/reviewImage.png',
                brandName: 'Skin treats',
                isVerified: true,
                campaignTitle: 'Free skincare kit',
                campaignLocation: 'Italy, shipped EU-wide',
                deliverables: '1 Reel + 2 IG stories',
                actionButtonsRow: ActionButtonsRow(
                  buttonImagePaths: const [
                    'assets/images/refresh.png',
                    'assets/images/cross.png',
                    'assets/images/heart.png',
                  ],
                  buttonRadius: 30,
                  iconSize: 28,
                  buttonBackgroundColor: Theme.of(context).colorScheme.surface,
                  onRefreshPressed: () => debugPrint('Refresh pressed'),
                  onRejectPressed: () => debugPrint('Reject pressed'),
                  onAcceptPressed: () => Navigator.pushNamed(context, AppRoutes.youMatchScreen),
                ),
              ),
            ),
          ),
          // Top User Header
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore Campaigns',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.surfaceDim,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  CustomPopupMenu()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


