import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';
import '../StatusBadge/status_badge.dart';

class BadgeAndRewardCard extends StatelessWidget {
  final String title;
  final String status;
  final String statusDescription;
  final String description;
  final String brandImagePath;

  const BadgeAndRewardCard({
    super.key,
    required this.title,
    required this.status,
    required this.statusDescription,
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(brandImagePath),
                radius: 35,
              ),
            ),
            title: Text(
              "Skin Treats",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "www.skintreats.co - @skintreats",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: Theme.of(context).colorScheme.surfaceDim),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              StatusBadge(
                text: status,
                verticalPadding: 2,
                horizontalPadding: 10,
                color:
                    status == "Under Review"
                        ? Color(0xFFFB8A2E).withOpacity(0.2)
                        : Theme.of(context).colorScheme.surfaceDim,
                textColor:
                    status == "Under Review"
                        ? Color(0xFFFB8A2E)
                        : Theme.of(context).colorScheme.primary,
                background:
                    status == "Under Review"
                        ? Color(0xFFFB8A2E).withOpacity(0.2)
                        : Theme.of(context).colorScheme.surfaceDim,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: Theme.of(context).colorScheme.surfaceDim),
          const SizedBox(height: 8),
          belowStatusSection(context, statusDescription),
        ],
      ),
    );
  }

  Widget belowStatusSection(BuildContext context, String status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Status:",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 10),
            Text(
              status,
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
