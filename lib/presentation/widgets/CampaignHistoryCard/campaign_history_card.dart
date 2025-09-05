import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';

class CampaignHistoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String offer;
  final String date;
  final String location;
  final String deliverables;
  final Color? statusColor;
  final double imageHeight;

  const CampaignHistoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.offer,
    required this.date,
    required this.location,
    required this.deliverables,
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
          Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(offer, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
              Text(date, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Campaign location:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                  Text(location,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deliverables:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                  Text(deliverables,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          onGoingSection(context,"Status:", "Campaign Completed")
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