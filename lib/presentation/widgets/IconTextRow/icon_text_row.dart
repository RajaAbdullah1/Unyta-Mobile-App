import 'package:flutter/material.dart';

import '../IconContainer/icon_container.dart';

Widget iconTextRow(
    BuildContext context, String icon, String title, String subtitle) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      IconContainer(assetPath: icon, size: 30,),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ],
        ),
      ),
    ],
  );
}