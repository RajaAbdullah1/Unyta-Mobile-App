import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';

class BrandInfoCard extends StatelessWidget {
  final String brandName;
  final String brandDescription;
  final String brandImagePath;
  final String websiteUrl;
  final String instagramHandle;

  const BrandInfoCard({
    super.key,
    required this.brandName,
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
            "About the Brand",
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

          /// --- Brand Info Row ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                brandImagePath,
                height: 60,
                width: 60,
              ),
              const SizedBox(width: 12),
              Expanded( // <-- this fixes overflow
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // align texts left
                  children: [
                    Text(
                      "Skin Treats",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      brandDescription,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      maxLines: 2, // optional: prevent too many lines
                      overflow: TextOverflow.ellipsis, // optional: handle overflow gracefully
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// --- Website Row ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/web.png", height: 30, width: 30),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Website",
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

              /// --- Instagram Row ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/insta.png",height: 30, width: 30),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Instagram",
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
              ),
            ],
          )

        ],
      ),
    );
  }
}



class BrandInfoCard2 extends StatelessWidget {
  final String brandName;
  final String brandDescription;
  final String brandImagePath;
  final String websiteUrl;
  final String instagramHandle;

  const BrandInfoCard2({
    super.key,
    required this.brandName,
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
            "About the Brand",
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

          /// --- Brand Info Row ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                brandImagePath,
                height: 60,
                width: 60,
              ),
              const SizedBox(width: 12),
              Expanded( // <-- this fixes overflow
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // align texts left
                  children: [
                    Text(
                      "Skin Treats",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          brandDescription,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          maxLines: 2, // optional: prevent too many lines
                          overflow: TextOverflow.ellipsis, // optional: handle overflow gracefully
                        ),
                        SizedBox(width: 5,),
                        Image.asset("assets/images/profile_check.png", height: 20, width: 20,)
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "View Profile",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold
                    ), // optional: handle overflow gracefully
                  ),

                  Icon(Icons.arrow_forward_outlined)
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// --- Website Row ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/web.png", height: 30, width: 30),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Website",
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

              /// --- Instagram Row ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/insta.png",height: 30, width: 30),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Instagram",
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
              ),
            ],
          )

        ],
      ),
    );
  }
}
