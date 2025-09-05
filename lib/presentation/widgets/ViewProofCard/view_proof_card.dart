import 'package:flutter/material.dart';

class ViewProofCard extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const ViewProofCard({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceDim,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Text(
                  actionText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
