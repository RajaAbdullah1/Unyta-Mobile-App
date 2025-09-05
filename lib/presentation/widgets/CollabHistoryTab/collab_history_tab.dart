import 'package:flutter/material.dart';
import 'package:unyta/routes/app_routes.dart';

import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_paddings.dart';
import '../CollabHistoryCard/collab_history_card.dart';
import '../SectionHeader/section_header.dart';

class CollabHistoryTab extends StatefulWidget {
  const CollabHistoryTab({super.key});

  @override
  State<CollabHistoryTab> createState() => _CollabHistoryTabState();
}

class _CollabHistoryTabState extends State<CollabHistoryTab> {
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
              Navigator.pushNamed(context, AppRoutes.previousCollabScreen);
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
            return Padding(
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
            );
          }),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
