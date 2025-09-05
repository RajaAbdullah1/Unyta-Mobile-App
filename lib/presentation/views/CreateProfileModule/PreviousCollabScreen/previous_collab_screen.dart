import 'package:flutter/material.dart';
import '../../../../core/styles/app_paddings.dart';
import '../../../widgets/CampaignBottomSheet/compaign_bottomsheet.dart';
import '../../../widgets/CollabHistoryCard/collab_history_card.dart';
import '../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';

class PreviousCollabScreen extends StatefulWidget {
  const PreviousCollabScreen({super.key});

  @override
  State<PreviousCollabScreen> createState() => _PreviousCollabScreenState();
}

class _PreviousCollabScreenState extends State<PreviousCollabScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Previous Collaborations",
        subtitle: "Discover your past campaigns and keep track of your completed collaborations, all in one place",
        height: size.height * 0.2,
        actionImagePath: "assets/images/profile_share.png", // image path
        onAction: () {
          print("Settings clicked");
        },
      ),
      body: ListView(
        padding: AppPaddings.horizontal20,
        children: [
          const SizedBox(height: 16),
          ...List.generate(5, (index) {
            return InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const CampaignBottomSheet(),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CollabHistoryCard(
                  imagePath: "assets/images/collab_history_image.png",
                  title: "Rumours Beach Club",
                  subtitle: "Lunch",
                  day: "Monday",
                  date: "May 14, 2025",
                  actionText: "Completed",
                  onActionPressed: () {},
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
