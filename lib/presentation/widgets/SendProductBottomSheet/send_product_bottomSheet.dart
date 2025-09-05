import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/DualActionButton/dual_action_button.dart';
import '../NewCreatorCard/new_creator_card.dart';

void sendProductBottomSheet(BuildContext context, VoidCallback onRightPressed) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Text(
              "Send Product",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            CreatorCard(
              name: "Olivia Jen",
              username: "@olivia.style",
              imagePath: "assets/images/match.png",
              simpleTile: true,
              onTap: () {
                debugPrint("View Profile clicked for Olivia Jen");
              },
              bgColor: Theme.of(context).colorScheme.surfaceBright,
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text("Address", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
              subtitle: Text("47 W 19th St, New York, NY 56248, USA"),
            ),
            const SizedBox(height: 24),
            DualActionButtons(
              leftButtonText: "Cancel",
              onLeftPressed: () {
                Navigator.pop(context);
              },
              rightButtonText: "Mark as Shipped",
              onRightPressed: onRightPressed
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
