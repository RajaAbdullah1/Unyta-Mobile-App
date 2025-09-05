
import 'package:flutter/material.dart';

Widget headingSection(String title, String value, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),

      const SizedBox(height: 2),
      Text(
        value,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    ],
  );
}