import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_border_radius.dart';
import '../../../provider/ReviewCardProvider/review_card_provider.dart';
import '../ActionButton/action_button.dart';

class ReviewCard extends StatelessWidget {
  final String date;
  final String reviewName;
  final double overallRating;
  final String collaborationFeedback;
  final String contentQuality;
  final List<ReviewItem> questions;
  final String gender;
  final String communication;
  final VoidCallback? onActionPressed;
  const ReviewCard({
    super.key,
    this.date = "",
    this.questions = const [],
    this.overallRating = 0.0,
    this.collaborationFeedback = "",
    this.contentQuality = "",
    this.gender = "",
    this.reviewName = "",
    this.communication = "",
    this.onActionPressed
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Review by $reviewName",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              ActionButton(
                text: "Close",
                buttonWidth: size.width * 0.05,
                buttonRadius: AppBorderRadius.roundedSmall,
                backgroundColor:
                Theme.of(context).colorScheme.surfaceDim,
                textColor: Theme.of(context).colorScheme.primary,
                buttonHeight: size.height * 0.035,
                onPressed: onActionPressed!,
              ),
            ],
          ),
          _buildItem(context, "Date", date),
          _buildRating(context, overallRating),
          ...questions.map((q) => _buildItem(context, q.question, q.answer)),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(value,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary)),
        ],
      ),
    );
  }

  Widget _buildRating(BuildContext context, double rating) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overall Rating:",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              Text("$rating",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary)),
              Image.asset("assets/images/star.png", height: 16, width: 16,)
            ],
          )
        ],
      ),
    );
  }
}

class ReviewItem {
  final String question;
  final String answer;

  const ReviewItem({
    required this.question,
    required this.answer,
  });
}