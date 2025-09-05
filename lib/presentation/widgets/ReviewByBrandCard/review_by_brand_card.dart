import 'package:flutter/material.dart';
class ReviewByBrandCard extends StatelessWidget {
  final String date;
  final String title;
  final double overallRating;
  final String collaborationFeedback;
  final String contentQuality;
  final String communication;
  final VoidCallback? onActionPressed;

  const ReviewByBrandCard({
    super.key,
    required this.title,
    this.date = "",
    this.overallRating = 0.0,
    this.collaborationFeedback = "",
    this.contentQuality = "",
    this.communication = "",
    this.onActionPressed
  });

  @override
  Widget build(BuildContext context) {
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
          !title.contains("Review given by Brand") ? SizedBox()  :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(backgroundImage: AssetImage("assets/images/reviewImage.png"), radius: 30,),
                title: Text("Brand Name",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text("Create content in exchange for curated offerings.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
              ),
            ],
          ),
           SizedBox(height: 10,),
          _buildRating(context, overallRating),
          _buildItem(context, "How did the collaboration go?", collaborationFeedback),
          _buildItem(context, "Was the content high-quality and delivered on time?", contentQuality),
          _buildItem(context, "Was communication professional?", communication),
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
              Image.asset("assets/images/star.png", height: 20, width: 30,)
            ],
          )
        ],
      ),
    );
  }
}