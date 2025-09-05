import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String profileImage;
  final String username;
  final String location;
  final String followers;
  final String engagementRate;
  final VoidCallback? onInstagramTap;
  final VoidCallback? onTiktokTap;
  final VoidCallback? onYoutubeTap;

  const ProfileHeaderWidget({
    super.key,
    required this.profileImage,
    required this.username,
    required this.location,
    required this.followers,
    required this.engagementRate,
    this.onInstagramTap,
    this.onTiktokTap,
    this.onYoutubeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(profileImage),
          ),
          const SizedBox(height: 12),

          // Username + Verified Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(username,
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(width: 6),
              Image.asset("assets/images/profile_check.png",
                  width: 32, height: 32),
            ],
          ),
          const SizedBox(height: 4),

          // Location
          Text(
            location,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          // Social icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onInstagramTap,
                child: Image.asset("assets/images/instagram.png",
                    width: 32, height: 32),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onTiktokTap,
                child: Image.asset("assets/images/tiktok.png",
                    width: 32, height: 32),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onYoutubeTap,
                child: Image.asset("assets/images/youtube.png",
                    width: 32, height: 32),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Followers + Engagement
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(followers,
                      style: Theme.of(context).textTheme.titleLarge),
                  Text("All Followers",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(width: 20),
              Container(
                height: 40,
                width: 2,
                color: Theme.of(context).colorScheme.surfaceDim,
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text(engagementRate,
                      style: Theme.of(context).textTheme.titleLarge),
                  Text("Engagement Rate",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
