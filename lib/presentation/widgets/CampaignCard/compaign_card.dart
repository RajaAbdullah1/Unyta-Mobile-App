import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/IconContainer/icon_container.dart';

class CampaignCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String locationLabel;
  final String location;
  final String deliverablesLabel;
  final String deliverables;
  final bool isShowIcons;
  final VoidCallback? deletedOnTap;
  const CampaignCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.locationLabel,
    required this.location,
    required this.deliverablesLabel,
    required this.deliverables,
    required this.isShowIcons,
    this.deletedOnTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all16,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceDim,
        ),
        borderRadius: AppBorderRadius.roundedMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locationLabel,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deliverablesLabel,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    deliverables,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),

          //********************* Show Icons *********************//
          if(isShowIcons == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                child: Image.asset("assets/images/profile_edit.png", height: 30, width: 30,),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: deletedOnTap,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                  child: Image.asset( "assets/images/delete.png", height: 30, width: 30, color: Theme.of(context).colorScheme.surfaceContainerHighest,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}