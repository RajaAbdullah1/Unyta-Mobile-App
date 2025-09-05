import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../core/styles/app_border_radius.dart';
import '../StatusBadge/status_badge.dart';

class MyCollabsCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? type;
  final String status;
  final String offer;
  final String date;
  final String location;
  final String deliverables;
  final Color? statusColor;
  final double imageHeight;
  final String tabStatus;
  final String? statusLabel;
  final String? statusValue;

  const MyCollabsCard({
    super.key,
    required this.imagePath,
    this.type,
    required this.title,
    required this.status,
    required this.offer,
    required this.date,
    required this.location,
    required this.deliverables,
    required this.tabStatus,
    this.statusLabel,
    this.statusValue,
    this.statusColor,
    this.imageHeight = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppBorderRadius.roundedMedium,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: AppBorderRadius.roundedMedium,
            child: Image.asset(
              imagePath,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/reviewImage.png",
                    ),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            type ?? "",
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 20),

              tabStatus == "completed"
                  ? StatusBadge(
                    text: status,
                    verticalPadding: 8,
                    horizontalPadding: 8,
                    color: Theme.of(context).colorScheme.onPrimary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                  )
                  : StatusBadge(
                    text: status,
                    verticalPadding: 8,
                    horizontalPadding: 8,
                  ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Campaign location:",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliverables:",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Text(
                    deliverables,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (tabStatus == "ongoing")
            onGoingSection(context, statusLabel!, statusValue!),
        ],
      ),
    );
  }

  Widget onGoingSection(BuildContext context, String lable, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 5),
        Divider(color: Theme.of(context).colorScheme.surfaceDim),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lable,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            SizedBox(width: 5),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
