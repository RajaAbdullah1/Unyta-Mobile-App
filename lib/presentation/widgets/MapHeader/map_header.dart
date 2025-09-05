import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String switchLabel;
  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;

  const MapHeader({
    super.key,
    this.title = "Map",
    this.subtitle = "Find nearby brands and \n creators",
    this.switchLabel = "My Location",
    required this.switchValue,
    required this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Left side (title + subtitle)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),

        /// Right side (label + switch)
        Row(
          children: [
            Text(
              switchLabel,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: switchValue,
                activeTrackColor: Theme.of(context).colorScheme.onPrimary,
                inactiveTrackColor: Theme.of(context).colorScheme.surfaceDim,
                thumbColor: Theme.of(context).colorScheme.primary,
                onChanged: onSwitchChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
