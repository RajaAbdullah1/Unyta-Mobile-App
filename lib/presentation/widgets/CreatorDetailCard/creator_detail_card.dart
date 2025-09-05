import 'package:flutter/material.dart';

import '../../../core/styles/app_border_radius.dart';

class CreatorDetailCard extends StatelessWidget {
  final String creatorName;
  final String brandDescription;
  final String brandImagePath;
  final String websiteUrl;
  final String instagramHandle;

  const CreatorDetailCard({
    super.key,
    required this.creatorName,
    required this.brandDescription,
    required this.brandImagePath,
    required this.websiteUrl,
    required this.instagramHandle,
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
          Text(
            "About the Creator",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),

          Text(
            "Get to know who you’re collaborating with",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// --- Website Row ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(brandImagePath),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        creatorName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        websiteUrl,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Using Since",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    instagramHandle,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ],
          )

        ],
      ),
    );
  }
}