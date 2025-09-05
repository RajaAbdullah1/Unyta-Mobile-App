import 'package:flutter/material.dart';

Widget appreciationMessage(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Text(
          "We appreciate your interest in joining our community.\nWe’ll be in touch shortly.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "— The Unyta Team",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
