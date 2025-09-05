import 'package:flutter/material.dart';
import '../BulletText/bullet_text.dart';

class CampaignDesCard extends StatelessWidget {
  final String title;
  final String lastTitle;
  final String lastValue;
  final String secondLastTitle;
  final String secondLastValue;
  final String cardName;
  final bool isHideProductStatus;
  const CampaignDesCard({super.key, required this.title, required this.lastTitle, required this.lastValue, required this.secondLastTitle, required this.secondLastValue, required this.cardName,  this.isHideProductStatus = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
               cardName == "whatsIncluded" ? whatsIncluded(context) :
               cardName == "contentRequirement" ?
               contextRequirement(context) : cardName == "who" ?
              _buildItem(context, "Location", "US-based creators only") : SizedBox(),
              _buildItem(context, secondLastTitle, secondLastValue),
              isHideProductStatus == true ? SizedBox()  :  _buildItem(context, lastTitle, lastValue),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
  Widget contextRequirement(BuildContext context,) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What the brand is looking for",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          bulletText(context,"1 Instagram Reel (creative, unboxing, or tutorial)"),
          bulletText(context,"2 Instagram Stories (tag brand and include swipe-up link)"),
        ],
      ),
    );
  }

  Widget whatsIncluded(BuildContext context,) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Here’s what you’ll receive",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          const SizedBox(height: 5),
          Text("Gifted Items:",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          bulletText(context,"Hydrating Cleanser (100ml)"),
          bulletText(context,"Vitamin C Serum"),
          bulletText(context,"Face Towel Kit"),
          const SizedBox(height: 5),
          _buildItem(context, "Retail Value:", "\$110 USD"),
        ],
      ),
    );
  }
}
