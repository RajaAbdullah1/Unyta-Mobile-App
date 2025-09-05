import 'package:flutter/material.dart';
import 'package:unyta/data/models/InfoSectionParagraphModel/info_section_pararaph.dart';

import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_colors.dart';
import '../BulletText/bullet_text.dart';
import '../InfoSectionWidget/info_section_widget.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final List<String> bulletPoints;
  final String? imagePath;
  final EdgeInsets padding;

  const InfoContainer({
    super.key,
    required this.title,
    required this.bulletPoints,
    this.imagePath,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        color: Colors.white,
        borderRadius: AppBorderRadius.roundedLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagePath != null) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceDim,
                borderRadius: AppBorderRadius.roundedMedium,
              ),
              child: Image.asset(imagePath!, height: 40, width: 40),
            ),
            const SizedBox(height: 12),
          ],
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (var point in bulletPoints) bulletText(context, point),
        ],
      ),
    );
  }
}







class InfoContainerWithSections extends StatelessWidget {
  final List<InfoSectionParagraphModel> sections;
  final String? imagePath;
  final EdgeInsets padding;

  const InfoContainerWithSections({
    super.key,
    required this.sections,
    this.imagePath,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        color: Colors.white,
        borderRadius: AppBorderRadius.roundedLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagePath != null) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceDim,
                borderRadius: AppBorderRadius.roundedMedium,
              ),
              child: Image.asset(imagePath!, height: 40, width: 40),
            ),
            const SizedBox(height: 12),
          ],
          ...List.generate(sections.length, (index) {
            final section = sections[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  section.text,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                ),
                if (index < sections.length - 1) ...[
                  const SizedBox(height: 5),
                  Divider(color: AppColors.border, thickness: 1),
                  const SizedBox(height: 12),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }
}

