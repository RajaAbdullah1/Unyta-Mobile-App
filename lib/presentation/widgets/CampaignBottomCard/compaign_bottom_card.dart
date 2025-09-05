import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';

class CampaignCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String status;
  final String offer;
  final String date;
  final String location;
  final String deliverables;
  final Color? statusColor;
  final double imageHeight;

  const CampaignCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.status,
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

          Row(
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(width: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceDim,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                      color:  Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
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
        ],
      ),
    );
  }
}