import 'package:flutter/material.dart';

import '../../../core/styles/app_border_radius.dart';
import '../ActionButton/action_button.dart';
import '../IconContainer/icon_container.dart';

class UpgradeCard extends StatelessWidget {
  const UpgradeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IconContainer(assetPath: "assets/images/unyta_advance.png"),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Unyta Advanced",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  "Upgrade your map to connect with nearby creators, and join campaigns with premium customer support",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Center(
                  child: ActionButton(
                    text: "Upgrade to Advance",
                    buttonHeight: size.height * 0.05,
                    buttonWidth: size.width * 0.06,
                    buttonRadius: AppBorderRadius.roundedSmall,
                    borderColor: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.primary,
                    backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                    onPressed: () {
                      // TODO: Handle upgrade button
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
