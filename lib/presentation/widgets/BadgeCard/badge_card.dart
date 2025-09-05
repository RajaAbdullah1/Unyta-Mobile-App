import 'package:flutter/material.dart';

class BadgeCard extends StatelessWidget {
  final String leadingImagePath;
  final String title;
  final String subtitle;
  final String trailingImagePath;
  final Color? color;
  final Color? borderColor;

  const BadgeCard({
    super.key,
    required this.leadingImagePath,
    required this.title,
    required this.subtitle,
    required this.trailingImagePath,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor ?? Theme.of(context).colorScheme.surfaceDim,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(leadingImagePath, height: 80, width: 80),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Image.asset(trailingImagePath, height: 25, width: 25),
        ],
      ),
    );
  }
}
