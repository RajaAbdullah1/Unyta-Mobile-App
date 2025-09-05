import 'package:flutter/material.dart';

import '../IconContainer/icon_container.dart';

Widget campaignDetailsCard(BuildContext context) {
  return customCard(
    context,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconContainer(assetPath: "assets/images/my_collabs.png"),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                "Spring style essentials",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Discover Vitamin C Serum! Our new campaign highlights how can transform. Join us and experience the difference.",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _infoColumn(context, "Estimated Retail Value", "\$1.5"),
            _infoColumn(context, "Shipping Timeline", "3 Days"),
          ],
        ),
      ],
    ),
  );
}

/// Creator Fit Card
Widget creatorFitCard(BuildContext context) {
  return customCard(
    context,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Creator Fit",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(height: 12),
        _twoColumnRow(
            context, "Creator Niche", "Fashion", "Location Requirement", "Texas"),
        const SizedBox(height: 8),
        _infoRow(context, "Min. Instagram Followers", "10k"),
        const SizedBox(height: 12),
        Text("Any Other Requirements?",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            )),
        const SizedBox(height: 4),
        Text(
          "Discover Vitamin C Serum! Our new campaign highlights how can transform. Join us and experience the difference.",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    ),
  );
}

/// Content Expectations Card
Widget contentExpectationsCard(BuildContext context) {
  return customCard(
    context,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Content Expectations",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(height: 12),
        _infoRow(context,
            "What Types Of Collaborations Are You Open To?", "IG Reel"),
        _twoColumnRow(context, "Due Date", "25 June, 2025", "Required Tag",
            "@skincare"),
      ],
    ),
  );
}

/// Common reusable card
Widget customCard(BuildContext context, {required Widget child}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
    ),
    child: child,
  );
}

/// Common info column
Widget _infoColumn(BuildContext context, String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          )),
      const SizedBox(height: 4),
      Text(value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          )),
    ],
  );
}

/// Common info row (single column style)
Widget _infoRow(BuildContext context, String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          )),
      const SizedBox(height: 4),
      Text(value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          )),
    ],
  );
}

/// Two column row
Widget _twoColumnRow(BuildContext context, String leftTitle, String leftValue,
    String rightTitle, String rightValue) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(child: _infoRow(context, leftTitle, leftValue)),
      Expanded(child: _infoRow(context, rightTitle, rightValue)),
    ],
  );
}