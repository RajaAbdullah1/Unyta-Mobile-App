import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/BadgeCard/badge_card.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import '../../../../provider/ReviewSubmittedScreenProvider/review_submitted_screen_provider.dart';
import '../../../../routes/app_routes.dart';

class ReviewSubmittedScreen extends StatelessWidget {
  const ReviewSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Review Submitted",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Thank you for your review! It will be visible to other creators once approved.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Badges Overview",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              // Bronze Badge
              GestureDetector(
                onTap: () {
                  context.read<BadgeSelectionProvider>().selectBadge(0);
                },
                child: Consumer<BadgeSelectionProvider>(
                  builder: (context, provider, _) => BadgeCard(
                    borderColor: provider.selectedIndex == 0
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    color: Theme.of(context).colorScheme.surfaceDim,
                    leadingImagePath: "assets/images/bronze_badge.png",
                    title: "3 campaigns submitted",
                    subtitle: "Bronze",
                    trailingImagePath: "assets/images/check.png",
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Silver Badge
              GestureDetector(
                onTap: () {
                  context.read<BadgeSelectionProvider>().selectBadge(1);
                },
                child: Consumer<BadgeSelectionProvider>(
                  builder: (context, provider, _) => BadgeCard(
                    borderColor: provider.selectedIndex == 1
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    color: Theme.of(context).colorScheme.surfaceDim,
                    leadingImagePath: "assets/images/silver_badge.png",
                    title: "5 campaigns submitted",
                    subtitle: "Silver Badge unlocked",
                    trailingImagePath: "assets/images/cursor.png",
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Gold Badge
              GestureDetector(
                onTap: () {
                  context.read<BadgeSelectionProvider>().selectBadge(2);
                },
                child: Consumer<BadgeSelectionProvider>(
                  builder: (context, provider, _) => BadgeCard(
                    borderColor: provider.selectedIndex == 2
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    color: Theme.of(context).colorScheme.surfaceDim,
                    leadingImagePath: "assets/images/gold_badge.png",
                    title: "Submit 10+ campaigns to unlock",
                    subtitle: "Gold",
                    trailingImagePath: "assets/images/lock.png",
                  ),
                ),
              ),

              const SizedBox(height: 20),
              ActionButton(
                textColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.transparent,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signupMethodScreen);
                },
                text: "Back to Home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
