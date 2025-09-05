import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';
import 'package:unyta/core/styles/app_colors.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/core/styles/app_text_styles.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';

class CheckCampaignBrief extends StatelessWidget {
  const CheckCampaignBrief({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.horizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Company Logo
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.white,
              child: Image.asset(
                "assets/images/reviewImage.png", // apna logo yahan daalna
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              "Campaign Brief",
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Review the details below and collaborate.",
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Image
            ClipRRect(
              borderRadius: AppBorderRadius.roundedLarge,
              child: Image.asset(
                "assets/images/burger.jpg", // apna image path
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // Lunch Card
            Container(
              width: double.infinity,
              padding: AppPaddings.all16,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
                color: AppColors.white,
                borderRadius: AppBorderRadius.roundedLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lunch",
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Please if you have a good experience leave a review.",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Complimentary Experience:",
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "• 1 fish sandwich or 1 Pasta or 1 Hot dish or 1 carpaccio + 1 drink",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color:Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Requirements Card
            Container(
              width: double.infinity,
              padding: AppPaddings.all16,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
                color: AppColors.white,
                borderRadius: AppBorderRadius.roundedLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Requirements",
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "What the brand is looking for:",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Post 2 stories",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color:Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Collaborate Button
            ActionButton(text: "Collaborate", onPressed: () {}),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
