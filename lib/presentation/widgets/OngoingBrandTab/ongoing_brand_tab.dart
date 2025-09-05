import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../routes/app_routes.dart';
import '../MyCampaignBrandCard/my_campaign_brand_card.dart';


class OngoingBrandTab extends StatelessWidget {
  const OngoingBrandTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all16,
      child: ListView.separated(itemBuilder: (context, index) {
        return  InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.ongoingDetailScreen,),
          child:
          MyCampaignBrandCard(
            imagePath: "assets/images/collab_history_image.png",
            title: "Spring Style Essentials",
            offer: "3-piece outfit",
            date: "May 14, 2025",
            location: "Italy, shipped EU-wide",
            deliverables: "1 Reel + 2 IG stories",
            status: "ongoing",
            productStatus: "Shipped",
            statusColor:
            Theme.of(context).colorScheme.surfaceDim, // optional
            imageHeight: 200, // optional
          ),
        );
      },
        separatorBuilder: (context, index) => SizedBox(height: 10), itemCount: 10,
      ),
    );
  }
}
