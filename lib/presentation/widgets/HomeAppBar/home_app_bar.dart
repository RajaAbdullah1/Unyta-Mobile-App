import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? appbarColor;
  final String profileImagePath;
  final VoidCallback? onProfileTap;
  // final VoidCallback? onNotificationTap;
  // final VoidCallback? onSettingsTap;

  const HomeAppBar({
    super.key,
    required this.title,
    required this.profileImagePath,
    this.appbarColor,
    this.onProfileTap,
    // this.onNotificationTap,
    // this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove default back arrow
      titleSpacing: 20,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: CircleAvatar(
              backgroundImage: AssetImage(profileImagePath),
              radius: 18,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color:
                  appbarColor ??
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.notificationScreen);
          },
          icon: Image.asset(
            color:
                appbarColor ??
                Theme.of(context).colorScheme.surfaceContainerHighest,
            "assets/images/bell.png",
            width: 24,
            height: 24,
          ),
        ),
        IconButton(
          onPressed:
              () => Navigator.pushNamed(context, AppRoutes.myProfileScreen),
          icon: Image.asset(
            "assets/images/settings.png",
            color:
                appbarColor ??
                Theme.of(context).colorScheme.surfaceContainerHighest,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 8), // Right padding
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
