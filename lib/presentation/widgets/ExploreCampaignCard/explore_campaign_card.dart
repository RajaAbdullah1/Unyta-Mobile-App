import 'package:flutter/material.dart';

class ExploreCampaignCard extends StatelessWidget {
  final String avatarImagePath;
  final String brandName;
  final bool isVerified;
  final String campaignTitle;
  final String campaignLocation;
  final String deliverables;
  final Color? textColor;
  final Color? secondaryTextColor;
  final Widget actionButtonsRow;

  const ExploreCampaignCard({
    super.key,
    required this.avatarImagePath,
    required this.brandName,
    this.isVerified = false,
    required this.campaignTitle,
    required this.campaignLocation,
    required this.deliverables,
    this.textColor = Colors.white,
    this.secondaryTextColor,
    required this.actionButtonsRow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceDim = secondaryTextColor ?? theme.colorScheme.surfaceDim;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(avatarImagePath),
            ),
            const SizedBox(width: 8),
            Text(
              brandName,
              style: theme.textTheme.headlineLarge!.copyWith(
                color: textColor,
              ),
            ),
            if (isVerified) ...[
              const SizedBox(width: 8),
              Image.asset(
                'assets/images/profile_check.png',
                width: 50,
                height: 50,
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        Text(
          campaignTitle,
          style: theme.textTheme.headlineMedium!.copyWith(
            color: surfaceDim,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Campaign location: $campaignLocation',
          style: theme.textTheme.titleMedium!.copyWith(
            color: textColor,
          ),
        ),
        Text(
          'Deliverables: $deliverables',
          style: theme.textTheme.titleMedium!.copyWith(
            color: textColor,
          ),
        ),
        const SizedBox(height: 16),
        actionButtonsRow,
      ],
    );
  }
}