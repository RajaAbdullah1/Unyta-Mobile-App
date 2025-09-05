import 'package:flutter/material.dart';
import '../../../core/styles/app_paddings.dart';
import '../../../routes/app_routes.dart';
import '../CollabHistoryCard/collab_history_card.dart';
import '../SectionHeader/section_header.dart';

class ReviewTab extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;
  const ReviewTab({super.key,  this.imagePath = "assets/images/reviewImage.png", this.name  = "Skin Treats",  this.role = "creator"});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).colorScheme.surfaceDim,
      child: ListView(
        padding: AppPaddings.horizontal16,
        children: [
          const SizedBox(height: 16),
          SectionHeader(
            title: "Reviews",
            actionText: "See All",
            onActionPressed: () => Navigator.pushNamed(
              context,
              AppRoutes.reviewScreen,
              arguments: {
                "role": role,
                "name": name,
                "imagePath": imagePath,
              },
            )
          ),
          const SizedBox(height: 12),
          ...List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CollabHistoryCard(
                imagePath: imagePath,
                imageWidth: size.width * 0.23,
                title: name,
                subtitle: "Lunch",
                day: "Monday",
                date: "May 14, 2025",
                actionText: "View",
                onActionPressed: () {},
                ratingText: "4.0",
              ),
            );
          }),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
