import 'package:flutter/material.dart';
import '../ReviewByBrandCard/review_by_brand_card.dart';

class CreatorReviewSection extends StatelessWidget {
  const CreatorReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Review given by Creator",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TabBar(
              labelColor: Theme.of(context).colorScheme.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              unselectedLabelColor: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.6),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              tabs: const [
                Tab(text: "Jennifer lu"),
                Tab(text: "My Review"),
              ],
            ),
            SizedBox(
              height: size.height * 0.4,
              child: TabBarView(
                children: [
                  ReviewByBrandCard(
                    title: "Creator Details",
                    overallRating: 4.0,
                    collaborationFeedback: "Nice collaboration",
                    contentQuality: "Good quality content",
                    communication: "Responsive",
                    onActionPressed: () {},
                  ),
                  ReviewByBrandCard(
                    title: "My Review",
                    overallRating: 3.5,
                    collaborationFeedback: "Helpful but room for improvement",
                    contentQuality: "Decent content",
                    communication: "Could be faster",
                    onActionPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
