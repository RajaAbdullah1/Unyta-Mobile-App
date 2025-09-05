import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String time;
  final double radius;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.time,
    this.radius = 30,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: radius,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
