import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_border_radius.dart';
import '../StatusBadge/status_badge.dart';

class AboutCreatorCard extends StatelessWidget {
  final String name;
  final String username;
  final String imagePath;
  final String status;
  final VoidCallback? onTap;
  final VoidCallback? viewProfileOnTap;
  final double? radius;

  const AboutCreatorCard({
    super.key,
    required this.name,
    required this.username,
    required this.imagePath,
    required this.status,
    this.radius = 25,
    this.onTap,
    this.viewProfileOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppBorderRadius.roundedMedium,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
      ),
      child: Column(
        children: [
          ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(imagePath),
            ),
            title: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              username,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            trailing: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 0,
                    maxWidth: 80,
                  ),
                  child: StatusBadge(
                    icon: "assets/images/message_icon.png",
                    onTap: onTap,
                    text: "Chat",
                    verticalPadding: 4,
                    horizontalPadding: 8,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Divider(color: Theme.of(context).colorScheme.surfaceDim,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Status:",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          status,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: viewProfileOnTap,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "View Proof",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          SizedBox(width: 5),
                         Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.onSecondary,)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
