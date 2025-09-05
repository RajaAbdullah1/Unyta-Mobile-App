import 'package:flutter/material.dart';

import '../IconSectionHeader/icon_section_header.dart';

class ContentStyleSection extends StatelessWidget {
  final String role;
  const ContentStyleSection({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconSectionHeader(
          isShowEdit: role.contains("creator") ? true : false,
          title: "Content Style",
          onEdit: () {},
          imagePath: "assets/images/edit.png",
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
          ),
          child: Text(
            "My content style is clean, modern, and educational, with a focus on minimalist aesthetics. I create high-quality, authentic content that simplifies beauty and wellness for a diverse audience.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
