import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';
import '../StatusBadge/status_badge.dart';

class CampaignBriefCard extends StatelessWidget {
  final String title;
  final String? status;
  final String description;
  final String brandImagePath;

  const CampaignBriefCard({
    super.key,
    required this.title,
    this.status,
    required this.description,
    required this.brandImagePath,
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
          CircleAvatar(backgroundImage: AssetImage(brandImagePath), radius: 35,),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              if(status != null && status == "requested")
              StatusBadge(text: "Pending", verticalPadding: 8, horizontalPadding: 8,),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          if(status == "requested")
            requestedSection(context),
        ],
      ),
    );
  }
  Widget requestedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "status:",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            SizedBox(width: 5,),
            Text(
              "Waiting for brand",
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
