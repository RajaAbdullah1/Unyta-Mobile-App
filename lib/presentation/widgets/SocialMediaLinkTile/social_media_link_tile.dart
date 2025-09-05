import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';

class SocialMediaLinkTile extends StatelessWidget {
  final String imagePath;
  final String text;

  const SocialMediaLinkTile({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 60,
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.roundedSmall,
              border: Border.all(
                color: Theme.of(context).colorScheme.surfaceDim,
              ),
            ),
            alignment: Alignment.center,
            child: Image.asset(imagePath, height: 28, width: 28),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.roundedSmall,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
