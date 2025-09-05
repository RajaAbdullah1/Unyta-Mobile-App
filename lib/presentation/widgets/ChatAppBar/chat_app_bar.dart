import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isVerified;
  final VoidCallback? onBack;

  const ChatAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.isVerified = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.blueGrey),
                  ),
                  if (isVerified) ...[
                    const SizedBox(width: 4),
                    Icon(
                      Icons.verified,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ]
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
