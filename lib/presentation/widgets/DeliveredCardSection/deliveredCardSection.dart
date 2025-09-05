import 'package:flutter/material.dart';

import '../ViewProofCard/view_proof_card.dart';

class DeliveredWorkSection extends StatelessWidget {
  const DeliveredWorkSection({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivered Work",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          "View your submitted proof to the brand",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        const SizedBox(height: 12),
        ...List.generate(2, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ViewProofCard(
              title: "IG Post",
              actionText: "View Profile",
              onTap: onTap,
            ),
          );
        }),
      ],
    );
  }
}
