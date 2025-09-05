import 'package:flutter/material.dart';

import '../../views/RatingRow/rating_row.dart';

class ExploreCreatorBrandCard extends StatelessWidget {
  final String avatarImagePath;
  final String creatorName;
  final bool isVerified;
  final String campaignTitle;
  final String campaignLocation;
  final String rating;
  final String engagementRate;
  final String followersCount;
  final Color? textColor;
  final Color? secondaryTextColor;
  final Widget actionButtonsRow;

  const ExploreCreatorBrandCard({
    super.key,
    required this.avatarImagePath,
    required this.creatorName,
    this.isVerified = false,
    required this.campaignTitle,
    required this.campaignLocation,
    required this.rating,
    required this.followersCount,
    required this.engagementRate,
    this.textColor = Colors.white,
    this.secondaryTextColor,
    required this.actionButtonsRow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              creatorName,
              style: theme.textTheme.headlineLarge!.copyWith(color: textColor),
            ),
            if (isVerified) ...[
              const SizedBox(width: 8),
              Image.asset(
                'assets/images/profile_check_white.png',
                width: 50,
                height: 50,
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        buildTextRowWidget('Location:', campaignLocation, context),
        const SizedBox(height: 10),
        buildRatingRow(
          context: context,
          rating: rating,
          crossAlignment: CrossAxisAlignment.start,
          mainAlignment: MainAxisAlignment.start,
          textColor: Theme.of(context).colorScheme.surface,
        ),
        const SizedBox(height: 10),
        buildTextRowWidget('Followers', followersCount, context),
        const SizedBox(height: 10),
        buildTextRowWidget('engagement rate', engagementRate, context),
        const SizedBox(height: 40),
        actionButtonsRow,
        const SizedBox(height: 30),
      ],
    );
  }

  Widget buildTextRowWidget(String label, String value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$label:',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: textColor),
        ),
        SizedBox(width: 10),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: textColor),
        ),
      ],
    );
  }
}
