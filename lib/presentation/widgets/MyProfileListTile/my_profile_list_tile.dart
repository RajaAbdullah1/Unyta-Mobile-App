import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String profileImage;
  final String name;
  final String username;
  final VoidCallback? onEditTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onTap;

  const ProfileListTile({
    super.key,
    required this.profileImage,
    required this.name,
    required this.username,
    this.onEditTap,
    this.onShareTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(profileImage),
      ),
      title: Row(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Image.asset("assets/images/profile_check.png", width: 20, height: 20),
        ],
      ),
      subtitle: Text(
        username,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onEditTap,
            child: Image.asset(
              "assets/images/profile_edit.png",
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onShareTap,
            child: Image.asset(
              "assets/images/profile_share.png",
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
