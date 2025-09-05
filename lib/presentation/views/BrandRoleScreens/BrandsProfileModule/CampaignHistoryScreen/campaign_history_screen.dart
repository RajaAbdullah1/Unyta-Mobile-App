import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../widgets/CampaignHistoryCard/campaign_history_card.dart';

class CampaignHistoryScreen extends StatefulWidget {
  const CampaignHistoryScreen({super.key});

  @override
  State<CampaignHistoryScreen> createState() => _CampaignHistoryScreenState();
}

class _CampaignHistoryScreenState extends State<CampaignHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(title: "Campaign History", subtitle: "Discover your past campaigns and keep track of your completed collaborations, all in one place.", height: size.height * 0.18,),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: AppPaddings.all16,
        children: [
          ...List.generate(5, (index) {
            return Column(
              children: [
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
                SizedBox(height: 10),
              ],
            );
          }),
        ],
      ),
    );
  }
}
