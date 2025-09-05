import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';

class CollabHistoryCard extends StatelessWidget {
  final String imagePath;
  final double? imageWidth;
  final String title;
  final String subtitle;
  final String day;
  final String date;
  final String actionText;
  final VoidCallback onActionPressed;
  final String ratingText;

  const CollabHistoryCard({
    super.key,
    required this.imagePath,
     this.imageWidth,
    required this.title,
    required this.subtitle,
    required this.day,
    required this.date,
    required this.actionText,
    required this.onActionPressed,
    this.ratingText = "",
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: imageWidth ??  size.width * 0.3,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (ratingText.isNotEmpty)...[
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/star.png",
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            ratingText,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    ]else...[
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                    ActionButton(
                      text: actionText,
                      buttonWidth: size.width * 0.05,
                      buttonRadius: AppBorderRadius.roundedSmall,
                      backgroundColor:
                      Theme.of(context).colorScheme.surfaceDim,
                      textColor: Theme.of(context).colorScheme.primary,
                      buttonHeight: size.height * 0.035,
                      onPressed: onActionPressed,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      day,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      " $date",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
