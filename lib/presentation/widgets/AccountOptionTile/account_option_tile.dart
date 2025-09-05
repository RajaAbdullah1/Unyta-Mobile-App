import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:unyta/core/styles/app_paddings.dart';

class AccountOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const AccountOptionTile({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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


class NotificationTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.vertical12, // or AppPaddings.vertical16
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Transform.scale(
            scale: 0.7, // shrink switch size
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
