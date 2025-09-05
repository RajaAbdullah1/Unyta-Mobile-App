import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';

class ProfileOptionTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  const ProfileOptionTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.vertical16,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(iconPath, height: 30, width: 30),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
