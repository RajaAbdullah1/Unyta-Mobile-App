import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';
import 'package:unyta/core/styles/app_paddings.dart';

class HomeInfoCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;

  const HomeInfoCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.13,
      padding: AppPaddings.all8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
        borderRadius: AppBorderRadius.roundedMedium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 30, width: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
