import 'package:flutter/material.dart';

import '../../views/RatingRow/rating_row.dart';

class ViewCreatorCard extends StatelessWidget {
  final String avatarImagePath;
  final String creatorName;
  final bool isVerified;
  final String campaignTitle;
  final String campaignLocation;
  final String rating;
  final Color? textColor;
  final Color? secondaryTextColor;

  const ViewCreatorCard({
    super.key,
    required this.avatarImagePath,
    required this.creatorName,
    this.isVerified = false,
    required this.campaignTitle,
    required this.campaignLocation,
    required this.rating,
    this.textColor = Colors.white,
    this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              creatorName,
              style: theme.textTheme.headlineLarge!.copyWith(color: textColor),
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
        const SizedBox(height: 10),
        Text(
          campaignTitle,
          style: theme.textTheme.headlineLarge!.copyWith(
            color: theme.colorScheme.onSecondary,
          ),
        ),
        const SizedBox(height: 10),
        buildTextRowWidget('Location', campaignLocation, context),
        const SizedBox(height: 10),
        buildRatingRow(
          title: "Completed Campaigns:",
          context: context,
          starAssetPath: "assets/images/completed_campign_badge.png",
          rating: '15',
            crossAlignment: CrossAxisAlignment.center, mainAlignment: MainAxisAlignment.center,
        ),
        buildRatingRow(context: context, rating: "4.5",crossAlignment: CrossAxisAlignment.center, mainAlignment: MainAxisAlignment.center,),
      ],
    );
  }

  Widget buildTextRowWidget(String label, String value, BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // 👈 row ko bhi center kar diya
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$label:',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        const SizedBox(width: 10),
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
