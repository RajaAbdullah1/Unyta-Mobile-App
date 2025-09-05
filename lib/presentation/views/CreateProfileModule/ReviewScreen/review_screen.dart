import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/styles/app_paddings.dart';
import '../../../../provider/ReviewCardProvider/review_card_provider.dart';
import '../../../widgets/CollabHistoryCard/collab_history_card.dart';
import '../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../widgets/ReviewCard/review_card.dart';

class ReviewScreen extends StatelessWidget {
  final String role;
  final String name;
  final String imagePath;
  const ReviewScreen({super.key, this.role = "creator", this.imagePath =  "assets/images/reviewImage.png", this.name = "Skin Treats"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Reviews",
        subtitle: "See all reviews given by brands",
        height: MediaQuery.of(context).size.height * 0.16,
      ),
      body: Consumer<ReviewCardProvider>(
        builder: (context, provider, _) {
          return ListView(
            padding: AppPaddings.horizontal16,
            children: List.generate(5, (index) {
              final isExpanded = provider.expandedIndex == index;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    CollabHistoryCard(
                      imagePath: imagePath,
                      imageWidth: MediaQuery.of(context).size.width * 0.27,
                      title: name,
                      subtitle: "Lunch",
                      day: "Monday",
                      date: "May 14, 2025",
                      ratingText: "4.0",
                      actionText: isExpanded ? "Hide" : "View",
                      onActionPressed: () {
                        provider.toggleExpand(index);
                      },
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: isExpanded
                          ? ReviewCard(
                        date: "12 Aug 2025",
                        reviewName: "Olivia Jen",
                        overallRating: 4.5,
                        questions: role == "creator"  ? [
                          ReviewItem(question: "How did the collaboration go?", answer: "Very smooth and professional"),
                          ReviewItem(question: "Was the content high-quality and delivered on time?", answer: "Yes, perfectly on time"),
                          ReviewItem(question: "Gender", answer: "Female"),
                          ReviewItem(question: "Was communication professional?", answer: "Absolutely"),
                        ] : [
                          ReviewItem(question: "What was your experience like?", answer: "Very good"),
                          ReviewItem(question: "Did the brand communicate clearly? Was the gifting process smooth?", answer: "Very good"),
                          ReviewItem(question: "Would you collaborate again?", answer: "Of course"),
                        ],
                        onActionPressed: () {
                          provider.toggleExpand(index);
                        },
                      )
                        : const SizedBox.shrink(),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
