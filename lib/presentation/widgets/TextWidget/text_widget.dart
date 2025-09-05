import 'package:flutter/material.dart';

Widget textWidget(BuildContext context, String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      Text(
        value,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}