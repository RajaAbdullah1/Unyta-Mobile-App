import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../routes/app_routes.dart';
import '../MyCollabsCard/my_collabs_card.dart';


class OngoingTab extends StatefulWidget {
  const OngoingTab({super.key});

  @override
  State<OngoingTab> createState() => _OngoingTabState();
}

class _OngoingTabState extends State<OngoingTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all16,
      child: ListView.separated(itemBuilder: (context, index) {
        return  InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.campaignBriefScreen, arguments: "ongoing"),
          child: MyCollabsCard(
            imagePath: "assets/images/collab_history_image.png",
            title: "Skin treats",
            type: "(Free skincare kit)",
            status: "Chat",
            offer: "Free skincare kit",
            date: "May 14, 2025",
            location: "Italy, shipped EU-wide",
            deliverables: "1 Reel + 2 IG stories",
            tabStatus: "ongoing",
            statusLabel: "Product Status:",
            statusValue: "Shipped by Brand",
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
