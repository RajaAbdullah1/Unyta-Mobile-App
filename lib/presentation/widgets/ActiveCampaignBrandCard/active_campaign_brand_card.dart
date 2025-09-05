import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../core/styles/app_border_radius.dart';
import '../NewCreatorCard/new_creator_card.dart';

class ActiveCampaignBrandCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String status;
  final String offer;
  final String date;
  final Color? statusColor;
  final double imageHeight;

  const ActiveCampaignBrandCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.status,
    required this.offer,
    required this.date,
    this.statusColor,
    this.imageHeight = 180,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppBorderRadius.roundedMedium,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPaddings.horizontal16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.25,
                      child: ClipRRect(
                        borderRadius: AppBorderRadius.roundedMedium,
                        child: Image.asset(
                          "assets/images/collab_history_image.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: size.height * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.surfaceDim,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    status,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Offer + Date Row
                            Row(
                              children: [
                                Text(
                                  offer,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.copyWith(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onSecondary,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  date,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CreatorCard(
            name: "Olivia Jen",
            username: "@olivia.style",
            imagePath: "assets/images/match.png",
            onTap: () {
              debugPrint("View Profile clicked for Olivia Jen");
            },
          ),
        ],
      ),
    );
  }
}
