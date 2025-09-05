import 'package:flutter/material.dart';

import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_paddings.dart';
import '../IconContainer/icon_container.dart';


class SubscriptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetPath;
  final double iconSize;

  const SubscriptionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.assetPath,
    this.iconSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconContainer(assetPath: assetPath, size: iconSize),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
