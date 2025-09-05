import 'package:flutter/material.dart';
import '../IconSectionHeader/icon_section_header.dart';

class BioSection extends StatelessWidget {
  final String about;
  final String description;
  final String role;
  const BioSection({
    super.key,
    required this.about,
    required this.description,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconSectionHeader(
          isShowEdit: role.contains("creator") ? true : false,
          title: "Bio",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                about,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
