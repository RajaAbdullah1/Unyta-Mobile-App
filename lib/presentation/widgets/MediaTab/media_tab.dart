import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../core/styles/app_border_radius.dart';

class MediaTab extends StatefulWidget {
  const MediaTab({super.key});

  @override
  State<MediaTab> createState() => _MediaTabState();
}

class _MediaTabState extends State<MediaTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceDim,
      child: ListView(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: AppPaddings.horizontal16,
            child: Text(
              "My Media",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.6,
            ),
            itemCount: 10, // Replace with your media items count
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: AppBorderRadius.roundedLarge,
                ),
                child: ClipRRect(
                  borderRadius: AppBorderRadius.roundedSmall,
                  child: Image.asset("assets/images/Thumbnails.png",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      )
    );
  }
}
