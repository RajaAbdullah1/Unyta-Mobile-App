import 'package:flutter/material.dart';

import '../BadgeCard/badge_card.dart';

class BadgeSection extends StatelessWidget {
  final bool showTitle;
  final Color? cardColor;
  const BadgeSection({super.key, required this.showTitle, this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showTitle == true?  Row(
          children: [
            Text("My Badge",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            Image.asset("assets/images/info.png", height: 25, width: 25),
          ],
        ) : SizedBox(),
        const SizedBox(height: 12),
         BadgeCard(
          color: cardColor ??  Theme.of(context).colorScheme.surface,
          leadingImagePath: "assets/images/bronze_badge.png",
          title: "3 campaigns submitted",
          subtitle: "Bronze",
          trailingImagePath: "assets/images/check.png",
        ),
        SizedBox(height: 12),
         BadgeCard(
          color: cardColor ??  Theme.of(context).colorScheme.surface,
          leadingImagePath: "assets/images/silver_badge.png",
          title: "5 campaigns submitted",
          subtitle: "Silver Badge unlocked",
          trailingImagePath: "assets/images/cursor.png",
        ),
        SizedBox(height: 12),
         BadgeCard(
          color: cardColor ??  Theme.of(context).colorScheme.surface,
          leadingImagePath: "assets/images/gold_badge.png",
          title: "Submit 10+ campaigns to unlock",
          subtitle: "Gold",
          trailingImagePath: "assets/images/lock.png",
        ),
      ],
    );
  }
}
