import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_colors.dart';
import '../NewCreatorCard/new_creator_card.dart';

class AboutCreatorBrandCompletedTab extends StatelessWidget {
  final String name;
  final String username;
  final String imagePath;
  final String buttonLabel;
  final VoidCallback onProfileTap;
  final VoidCallback? onProofTap;

  const AboutCreatorBrandCompletedTab({
    super.key,
    required this.name,
    required this.username,
    required this.imagePath,
    required this.buttonLabel,
    required this.onProfileTap,
    this.onProofTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppBorderRadius.roundedMedium,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          CreatorCard(
            name: name,
            username: username,
            imagePath: imagePath,
            onTap: onProfileTap,
            buttonLabel: buttonLabel,
            verticalPadding: 0,
          ),
          const Divider(thickness: 0.2),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onProofTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "View Submitted Proof",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
