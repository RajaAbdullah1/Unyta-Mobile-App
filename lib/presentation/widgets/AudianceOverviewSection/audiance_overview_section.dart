import 'package:flutter/material.dart';
import '../../../data/models/InfoSectionParagraphModel/info_section_pararaph.dart';
import '../IconSectionHeader/icon_section_header.dart';

class AudienceOverviewSection extends StatelessWidget {
  final String heading;
  final List<InfoSectionParagraphModel> items;
  final VoidCallback? onEdit;
  final String role;

  const AudienceOverviewSection({
    super.key,
    required this.items,
    required this.heading,
    required this.role,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconSectionHeader(
          isShowEdit: role.contains("creator") ? true : false,
          title: heading,
          onEdit: onEdit ?? () {},
          imagePath: "assets/images/edit.png",
        ),
        const SizedBox(height: 5),
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
            children: items
                .map((item) => _buildItem(context, item.title ?? "", item.text))
                .toList(),
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
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
