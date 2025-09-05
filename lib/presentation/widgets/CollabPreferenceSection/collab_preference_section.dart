import 'package:flutter/material.dart';
import '../IconSectionHeader/icon_section_header.dart';

class CollabPreferencesSection extends StatelessWidget {
  final String role;
  const CollabPreferencesSection({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final prefs = ["Product gifting", "Paid collaborations", "Experiences"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconSectionHeader(
          isShowEdit: role.contains("creator") ? true : false,
          title: "Collab Preferences",
          onEdit: () {},
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
            children: [
              Text("Open To:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: prefs
                    .map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    p,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary),
                  ),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
