import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';
import '../NewCreatorCard/new_creator_card.dart';
import '../TextWidget/text_widget.dart';

class MyCampaignBrandCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String offer;
  final String date;
  final String location;
  final String deliverables;
  final String? status;
  final String? productStatus;
  final int? totalApplied;
  final int? selected;
  final Color? statusColor;
  final double imageHeight;

  const MyCampaignBrandCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.offer,
    required this.date,
    required this.location,
    required this.deliverables,
    this.statusColor,
    this.status,
    this.productStatus,
    this.totalApplied,
    this.selected,
    this.imageHeight = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppBorderRadius.roundedMedium,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: AppBorderRadius.roundedMedium,
            child: Image.asset(
              imagePath,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                offer,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              Text(
                date,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(context, "Campaign location:", location),
              textWidget(context, "Deliverables:", deliverables),
            ],
          ),

          //*********************  Status Section ***********************
          if (status == "ongoing")
            onGoingSection(
              context,
              "Status:",
              "Campaign Completed",
              productStatus ?? "",
            )
          else if (status == "pending")
            pendingSection(
              context,
              "Status:",
              "Campaign Completed",
              totalApplied!,
              selected!,
            )
          else if (status == "completed")
            completedSection(context, "Status:", "Campaign Completed"),
        ],
      ),
    );
  }

  //**************************** onGoing Section Widget ****************************//
  Widget onGoingSection(
    BuildContext context,
    String lable,
    String value,
    String productStatus,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        textWidget(context, "Product Status:", productStatus),
        SizedBox(height: 5),
        Divider(color: Theme.of(context).colorScheme.surfaceDim),
        CreatorCard(
          radius: 30,
          buttonLabel: "Chat",
          name: "Olivia Jen",
          username: "@olivia.style",
          imagePath: "assets/images/match.png",
          onTap: () {
            debugPrint("View Profile clicked for Olivia Jen");
          },
        ),
      ],
    );
  }

  //**************************** pending Section Widget ****************************//
  Widget pendingSection(
    BuildContext context,
    String label,
    String value,
    int totalApplied,
    int selected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Divider(color: Theme.of(context).colorScheme.surfaceDim),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(context, "Total applied", totalApplied.toString()),
            textWidget(context, "Selected", selected.toString()),
          ],
        ),
      ],
    );
  }

  //**************************** completed Section Widget ****************************//
  Widget completedSection(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Divider(color: Theme.of(context).colorScheme.surfaceDim),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            SizedBox(width: 5),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

}
