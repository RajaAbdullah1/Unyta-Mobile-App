import 'package:flutter/material.dart';

Widget buildRatingRow({
  required BuildContext context,
  required String rating,
  required MainAxisAlignment mainAlignment,
  required CrossAxisAlignment crossAlignment,
  String title = "Overall Rating:",
  Color? textColor,
  String starAssetPath = "assets/images/star.png",
}) {
  final theme = Theme.of(context);

  return Row(
    mainAxisAlignment: mainAlignment,
    crossAxisAlignment: crossAlignment,
    children: [
      Text(
        title,
        style: theme.textTheme.titleMedium!.copyWith(
          color: textColor ?? theme.colorScheme.onSecondary,
        ),
      ),
      const SizedBox(width: 10),
      Image.asset(starAssetPath, width: 20, height: 20),
      const SizedBox(width: 10),
      Text(
        rating,
        style: theme.textTheme.titleMedium
      ),
    ],
  );
}
